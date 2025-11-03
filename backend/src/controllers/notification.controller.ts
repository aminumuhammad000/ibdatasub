// controllers/notification.controller.ts
import { Response } from 'express';
import { Notification } from '../models';
import { NotificationService } from '../services/notification.service';
import { ApiResponse } from '../utils/response';
import { AuthRequest } from '../types';

export class NotificationController {
  static async getNotifications(req: AuthRequest, res: Response) {
    try {
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 10;
      const skip = (page - 1) * limit;

      const notifications = await Notification.find({ user_id: req.user?.id })
        .skip(skip)
        .limit(limit)
        .sort({ created_at: -1 });

      const total = await Notification.countDocuments({ user_id: req.user?.id });
      const unread = await Notification.countDocuments({ user_id: req.user?.id, read_status: false });

      return ApiResponse.paginated(res, notifications, {
        page,
        limit,
        total,
        unread,
        pages: Math.ceil(total / limit)
      }, 'Notifications retrieved successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async markAsRead(req: AuthRequest, res: Response) {
    try {
      const { id } = req.params;
      const success = await NotificationService.markAsRead(id as any);

      if (!success) {
        return ApiResponse.error(res, 'Notification not found', 404);
      }

      return ApiResponse.success(res, null, 'Notification marked as read');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async markAllAsRead(req: AuthRequest, res: Response) {
    try {
      await Notification.updateMany(
        { user_id: req.user?.id, read_status: false },
        { read_status: true }
      );

      return ApiResponse.success(res, null, 'All notifications marked as read');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }
}