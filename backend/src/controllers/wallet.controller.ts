// controllers/wallet.controller.ts
import { Response } from 'express';
import { Wallet, Transaction } from '../models';
import { WalletService } from '../services/wallet.service';
import { ApiResponse } from '../utils/response';
import { AuthRequest } from '../types';

export class WalletController {
  static async getWallet(req: AuthRequest, res: Response) {
    try {
      const wallet = await Wallet.findOne({ user_id: req.user?.id });
      if (!wallet) {
        return ApiResponse.error(res, 'Wallet not found', 404);
      }

      return ApiResponse.success(res, wallet, 'Wallet retrieved successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async fundWallet(req: AuthRequest, res: Response) {
    try {
      const { amount, payment_method } = req.body;

      if (amount <= 0) {
        return ApiResponse.error(res, 'Invalid amount', 400);
      }

      const wallet = await Wallet.findOne({ user_id: req.user?.id });
      if (!wallet) {
        return ApiResponse.error(res, 'Wallet not found', 404);
      }

      // Create transaction record
      const transaction = await Transaction.create({
        user_id: req.user?.id,
        wallet_id: wallet._id,
        type: 'wallet_topup',
        amount,
        fee: 0,
        total_charged: amount,
        status: 'pending',
        reference_number: `TXN-${Date.now()}`,
        payment_method
      });

      // Process payment (integrate with payment gateway)
      // For now, we'll simulate success
      await WalletService.creditWallet(wallet.user_id, amount);
      transaction.status = 'successful';
      await transaction.save();

      return ApiResponse.success(res, { transaction, wallet }, 'Wallet funded successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }
}