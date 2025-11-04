// services/notification.service.ts
import { Notification } from '../models/index.js';
import { Types } from 'mongoose';

export class NotificationService {
  static async createNotification(data: {
    user_id?: Types.ObjectId;
    type: string;
    title: string;
    message: string;
    action_link?: string;
  }) {
    return await Notification.create(data);
  }

  static async sendTransactionNotification(user_id: Types.ObjectId, transaction: any) {
    await this.createNotification({
      user_id,
      type: 'transaction_alert',
      title: 'Transaction Alert',
      message: `Your ${transaction.type} transaction of ₦${transaction.amount} was ${transaction.status}`,
      action_link: `/transactions/${transaction._id}`
    });
  }

  static async markAsRead(notification_id: Types.ObjectId): Promise<boolean> {
    const notification = await Notification.findById(notification_id);
    if (!notification) return false;

    notification.read_status = true;
    await notification.save();
    return true;
  }
}