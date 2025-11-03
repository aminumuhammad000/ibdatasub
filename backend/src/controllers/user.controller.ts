// controllers/user.controller.ts
import { Response } from 'express';
import { User } from '../models';
import { ApiResponse } from '../utils/response';
import { AuthRequest } from '../types';

export class UserController {
  static async getProfile(req: AuthRequest, res: Response) {
    try {
      const user = await User.findById(req.user?.id).select('-password_hash');
      if (!user) {
        return ApiResponse.error(res, 'User not found', 404);
      }

      return ApiResponse.success(res, user, 'Profile retrieved successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async updateProfile(req: AuthRequest, res: Response) {
    try {
      const allowedUpdates = ['first_name', 'last_name', 'address', 'city', 'state', 'date_of_birth'];
      const updates = Object.keys(req.body)
        .filter(key => allowedUpdates.includes(key))
        .reduce((obj: any, key) => {
          obj[key] = req.body[key];
          return obj;
        }, {});

      const user = await User.findByIdAndUpdate(
        req.user?.id,
        { ...updates, updated_at: new Date() },
        { new: true }
      ).select('-password_hash');

      return ApiResponse.success(res, user, 'Profile updated successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async uploadKYC(req: AuthRequest, res: Response) {
    try {
      const { kyc_document_id_front_url, kyc_document_id_back_url } = req.body;

      const user = await User.findByIdAndUpdate(
        req.user?.id,
        {
          kyc_document_id_front_url,
          kyc_document_id_back_url,
          kyc_status: 'pending',
          updated_at: new Date()
        },
        { new: true }
      ).select('-password_hash');

      return ApiResponse.success(res, user, 'KYC documents uploaded successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async getAllUsers(req: AuthRequest, res: Response) {
    try {
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 10;
      const skip = (page - 1) * limit;

      const users = await User.find()
        .select('-password_hash')
        .skip(skip)
        .limit(limit)
        .sort({ created_at: -1 });

      const total = await User.countDocuments();

      return ApiResponse.paginated(res, users, {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit)
      }, 'Users retrieved successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }
}