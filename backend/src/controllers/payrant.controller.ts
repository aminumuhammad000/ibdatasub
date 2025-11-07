// controllers/payrant.controller.ts
import { Response } from 'express';
import { User } from '../models/index.js';
import { payrantService } from '../services/payrant.service.js';
import { AuthRequest } from '../types/index.js';
import { ApiResponse } from '../utils/response.js';

export class PayrantController {
  /**
   * Create a new Payrant virtual account for the authenticated user
   */
  static async createVirtualAccount(req: AuthRequest, res: Response) {
    try {
      const userId = req.user?.id;
      if (!userId) {
        return ApiResponse.error(res, 'User not authenticated', 401);
      }

      const user = await User.findById(userId);
      if (!user) {
        return ApiResponse.error(res, 'User not found', 404);
      }

      // Prepare virtual account data
      const virtualAccountData = {
        documentType: req.body.documentType, // 'nin' or 'bvn'
        documentNumber: req.body.documentNumber,
        virtualAccountName: req.body.virtualAccountName || `${user.firstName} ${user.lastName}`,
        customerName: req.body.customerName || `${user.firstName} ${user.lastName}`,
        email: req.body.email || user.email,
        accountReference: req.body.accountReference || `user-${userId}-${Date.now()}`,
      };

      // Create virtual account
      const virtualAccount = await payrantService.createVirtualAccount(virtualAccountData);

      // Update user with virtual account details
      user.virtualAccount = {
        accountNumber: virtualAccount.account_no,
        accountName: virtualAccount.virtualAccountName,
        bankName: 'Payrant',
        reference: virtualAccount.accountReference,
        provider: 'payrant',
        isActive: true,
      };

      await user.save();

      return ApiResponse.success(
        res,
        'Virtual account created successfully',
        user.virtualAccount
      );
    } catch (error: any) {
      console.error('Error creating virtual account:', error);
      return ApiResponse.error(
        res,
        error.message || 'Failed to create virtual account',
        error.status || 500
      );
    }
  }

  /**
   * Get user's Payrant virtual account details
   */
  static async getVirtualAccount(req: AuthRequest, res: Response) {
    try {
      const userId = req.user?.id;
      if (!userId) {
        return ApiResponse.error(res, 'User not authenticated', 401);
      }

      const user = await User.findById(userId);
      if (!user) {
        return ApiResponse.error(res, 'User not found', 404);
      }

      if (!user.virtualAccount) {
        return ApiResponse.success(
          res,
          { exists: false },
          'No virtual account found'
        );
      }

      return ApiResponse.success(
        res,
        'Virtual account retrieved successfully',
        {
          exists: true,
          ...user.virtualAccount.toObject()
        }
      );
    } catch (error: any) {
      console.error('Error fetching virtual account:', error);
      return ApiResponse.error(
        res,
        error.message || 'Failed to fetch virtual account',
        error.status || 500
      );
    }
  }
}
