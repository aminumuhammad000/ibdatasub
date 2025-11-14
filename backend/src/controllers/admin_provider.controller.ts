import { Request, Response } from 'express';
import ProviderConfig from '../models/provider.model.js';
import logger from '../utils/logger.js';
import { ApiResponse } from '../utils/response.js';

export class AdminProviderController {
  static async list(req: Request, res: Response) {
    try {
      const { active } = req.query;
      const filter: any = {};
      if (active !== undefined) filter.active = String(active) === 'true';
      const providers = await ProviderConfig.find(filter).sort({ priority: 1, name: 1 });
      // Omit env secrets in list response
      const sanitized = providers.map((p: any) => {
        const obj = p.toObject();
        if (obj.metadata && obj.metadata.env) {
          obj.metadata = { ...obj.metadata };
          delete obj.metadata.env;
        }
        return obj;
      });
      return ApiResponse.success(res, 'Providers retrieved', { providers: sanitized, total: providers.length });
    } catch (error) {
      logger.error('Error listing providers:', error);
      return ApiResponse.error(res, 'Failed to list providers', 500);
    }
  }

  static async getById(req: Request, res: Response) {
    try {
      const provider = await ProviderConfig.findById(req.params.id);
      if (!provider) return ApiResponse.error(res, 'Provider not found', 404);
      return ApiResponse.success(res, 'Provider retrieved', { provider });
    } catch (error) {
      logger.error('Error getting provider:', error);
      return ApiResponse.error(res, 'Failed to get provider', 500);
    }
  }

  static async create(req: Request, res: Response) {
    try {
      const { name, code, base_url, api_key, secret_key, username, password, active, priority, supported_services, metadata } = req.body;
      if (!name || !code) return ApiResponse.error(res, 'name and code are required', 400);
      const exists = await ProviderConfig.findOne({ code });
      if (exists) return ApiResponse.error(res, 'Provider code already exists', 400);
      const created = await ProviderConfig.create({
        name,
        code: String(code).toLowerCase(),
        base_url,
        api_key,
        secret_key,
        username,
        password,
        active: active !== false,
        priority: priority ?? 1,
        supported_services: Array.isArray(supported_services) ? supported_services : [],
        metadata,
      });
      logger.info(`Provider created: ${created.code}`);
      return ApiResponse.success(res, 'Provider created', { provider: created }, 201);
    } catch (error) {
      logger.error('Error creating provider:', error);
      return ApiResponse.error(res, 'Failed to create provider', 500);
    }
  }

  static async update(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const provider = await ProviderConfig.findById(id);
      if (!provider) return ApiResponse.error(res, 'Provider not found', 404);

      const { name, code, base_url, api_key, secret_key, username, password, active, priority, supported_services, metadata } = req.body;
      if (name !== undefined) provider.name = name;
      if (code !== undefined) provider.code = String(code).toLowerCase();
      if (base_url !== undefined) provider.base_url = base_url;
      if (api_key !== undefined) provider.api_key = api_key;
      if (secret_key !== undefined) provider.secret_key = secret_key;
      if (username !== undefined) provider.username = username;
      if (password !== undefined) provider.password = password;
      if (active !== undefined) provider.active = Boolean(active);
      if (priority !== undefined) provider.priority = Number(priority);
      if (supported_services !== undefined) provider.supported_services = Array.isArray(supported_services) ? supported_services : [];
      if (metadata !== undefined) provider.metadata = metadata;

      await provider.save();
      logger.info(`Provider updated: ${id}`);
      return ApiResponse.success(res, 'Provider updated', { provider });
    } catch (error) {
      logger.error('Error updating provider:', error);
      return ApiResponse.error(res, 'Failed to update provider', 500);
    }
  }

  static async remove(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const removed = await ProviderConfig.findByIdAndDelete(id);
      if (!removed) return ApiResponse.error(res, 'Provider not found', 404);
      logger.info(`Provider deleted: ${id}`);
      return ApiResponse.success(res, 'Provider deleted', { provider: removed });
    } catch (error) {
      logger.error('Error deleting provider:', error);
      return ApiResponse.error(res, 'Failed to delete provider', 500);
    }
  }

  // Get only env backup
  static async getEnv(req: Request, res: Response) {
    try {
      const provider = await ProviderConfig.findById(req.params.id);
      if (!provider) return ApiResponse.error(res, 'Provider not found', 404);
      const env = (provider.metadata as any)?.env || {};
      return ApiResponse.success(res, 'Provider env retrieved', { env });
    } catch (error) {
      logger.error('Error getting provider env:', error);
      return ApiResponse.error(res, 'Failed to get provider env', 500);
    }
  }

  // Update only env backup
  static async updateEnv(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const { env } = req.body as { env: Record<string, string> };
      const provider = await ProviderConfig.findById(id);
      if (!provider) return ApiResponse.error(res, 'Provider not found', 404);
      const meta: any = provider.metadata || {};
      meta.env = env || {};
      provider.metadata = meta;
      await provider.save();
      return ApiResponse.success(res, 'Provider env updated', { env: meta.env });
    } catch (error) {
      logger.error('Error updating provider env:', error);
      return ApiResponse.error(res, 'Failed to update provider env', 500);
    }
  }
}

export default AdminProviderController;
