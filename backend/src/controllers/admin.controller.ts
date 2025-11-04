// controllers/admin.controller.ts
import { Request, Response } from 'express';
import bcrypt from 'bcryptjs';
import jwt, { SignOptions } from 'jsonwebtoken';
import { AdminUser, User, AuditLog, Transaction } from '../models';
import { AdminService } from '../services/admin.service';
import { ApiResponse } from '../utils/response';
import { AuthRequest } from '../types';
import { config } from '../config/env.js';

export class AdminController {
  static async login(req: Request, res: Response) {
    try {
      const { email, password } = req.body;

      const admin = await AdminUser.findOne({ email }).populate('role_id');
      if (!admin) {
        return ApiResponse.error(res, 'Invalid credentials', 401);
      }

      const isPasswordValid = await bcrypt.compare(password, admin.password_hash);
      if (!isPasswordValid) {
        return ApiResponse.error(res, 'Invalid credentials', 401);
      }

      if (admin.status !== 'active') {
        return ApiResponse.error(res, 'Account is inactive', 403);
      }

      admin.last_login_at = new Date();
      await admin.save();

      const token = jwt.sign(
        { id: admin._id, role: 'admin' },
        config.jwtSecret as string,
        { expiresIn: config.jwtExpiry } as SignOptions
      );

      return ApiResponse.success(res, { admin, token }, 'Login successful');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async getDashboardStats(req: AuthRequest, res: Response) {
    try {
      const totalUsers = await User.countDocuments();
      const activeUsers = await User.countDocuments({ status: 'active' });
      const totalTransactions = await Transaction.countDocuments();
      const successfulTransactions = await Transaction.countDocuments({ status: 'successful' });

      const stats = {
        totalUsers,
        activeUsers,
        totalTransactions,
        successfulTransactions
      };

      return ApiResponse.success(res, stats, 'Dashboard stats retrieved successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async updateUserStatus(req: AuthRequest, res: Response) {
    try {
      const { status } = req.body;
      const user = await User.findById(req.params.id);

      if (!user) {
        return ApiResponse.error(res, 'User not found', 404);
      }

      const oldStatus = user.status;
      user.status = status;
      user.updated_at = new Date();
      await user.save();

      // Log action
      await AdminService.logAction({
        admin_id: req.user?.id as any,
        action: 'user_status_updated',
        entity_type: 'User',
        entity_id: user._id,
        old_value: { status: oldStatus },
        new_value: { status },
        ip_address: req.ip
      });

      return ApiResponse.success(res, user, 'User status updated successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async getAuditLogs(req: AuthRequest, res: Response) {
    try {
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 10;
      const skip = (page - 1) * limit;

      const logs = await AuditLog.find()
        .populate('admin_id', 'first_name last_name email')
        .populate('user_id', 'first_name last_name email')
        .skip(skip)
        .limit(limit)
        .sort({ timestamp: -1 });

      const total = await AuditLog.countDocuments();

      return ApiResponse.paginated(res, logs, {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit)
      }, 'Audit logs retrieved successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }
}