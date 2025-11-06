// controllers/payment.controller.ts
import { Response, Request } from 'express';
import { Types } from 'mongoose';
import { WalletService } from '../services/wallet.service.js';
import { Transaction, User, Wallet } from '../models/index.js';
import { ApiResponse } from '../utils/response.js';
import { AuthRequest } from '../types/index.js';
import { MonnifyService } from '../services/monnify.service.js';
import { PaystackService } from '../services/paystack.service.js';

// Initialize services
const monnifyService = new MonnifyService();
const paystackService = new PaystackService();

// Mock services for now
const mockServices = {
  payrant: {
    initializePayment: async () => ({
      checkoutUrl: 'https://payrant.com/checkout/mock',
      reference: 'MOCK' + Date.now()
    })
  }
};

export class PaymentController {
  /**
   * Handle Monnify webhook for payment confirmation
   * @param req Express request object
   * @param res Express response object
   */
  static async handleMonnifyWebhook(req: Request, res: Response) {
    try {
      const event = req.body;
      
      // Verify the webhook is from Monnify
      const signature = req.headers['monnify-signature'] as string;
      const isVerified = monnifyService.validateWebhookSignature(event, signature);
      
      if (!isVerified) {
        return res.status(400).json({ status: false, message: 'Invalid webhook signature' });
      }
      
      // Handle different event types
      if (event.eventType === 'SUCCESSFUL_TRANSACTION') {
        const { paymentReference, amount, customer } = event.eventData;
        
        // Update wallet balance
        const wallet = await Wallet.findOne({ userId: customer.email });
        if (wallet) {
          wallet.balance += amount;
          await wallet.save();
          
          // Record transaction
          await Transaction.create({
            userId: wallet.userId,
            amount,
            type: 'credit',
            status: 'completed',
            reference: paymentReference,
            description: 'Wallet funding via Monnify',
            metadata: { gateway: 'monnify' }
          });
        }
      }
      
      return res.status(200).json({ status: true });
    } catch (error) {
      console.error('Monnify webhook error:', error);
      return res.status(500).json({ status: false, message: 'Webhook processing failed' });
    }
  }
  /**
   * Get list of supported banks from Paystack
   * @param req Express request object
   * @param res Express response object
   */
  static async getBanks(_req: Request, res: Response) {
    try {
      const banks = await paystackService.listBanks();
      return ApiResponse.success(res, 'Banks retrieved successfully', banks);
    } catch (error: any) {
      console.error('Error fetching banks:', error);
      return ApiResponse.error(res, error.message || 'Failed to fetch banks', 500);
    }
  }

  static async initiatePayment(req: AuthRequest, res: Response) {
    try {
      const { amount, gateway = 'paystack', email } = req.body;
      const userId = req.user?.id;

      if (!userId) {
        return ApiResponse.error(res, 'User not authenticated', 401);
      }

      if (!amount || amount <= 0) {
        return ApiResponse.error(res, 'Invalid amount', 400);
      }

      if (amount < 100) {
        return ApiResponse.error(res, 'Minimum amount is NGN 100', 400);
      }

      if (amount > 1000000) {
        return ApiResponse.error(res, 'Maximum amount is NGN 1,000,000', 400);
      }

      // Get user and wallet
      const user = await User.findById(userId);
      if (!user) {
        return ApiResponse.error(res, 'User not found', 404);
      }

      const wallet = await Wallet.findOne({ user_id: userId });
      if (!wallet) {
        return ApiResponse.error(res, 'Wallet not found', 404);
      }

      // Route to the appropriate payment gateway
      switch (gateway) {
        case 'paystack':
          if (!email) {
            return ApiResponse.error(res, 'Email is required for Paystack payments', 400);
          }
          return await PaymentController.initiatePaystackPayment(res, user, wallet, amount, email);
          
        case 'monnify':
          return await PaymentController.initiateMonnifyPayment(res, user, wallet, amount);
          
        case 'payrant':
          return await PaymentController.initiatePayrantPayment(res, user, wallet, amount);
          
        default:
          return ApiResponse.error(res, 'Invalid payment gateway', 400);
      }
    } catch (error: any) {
      console.error('Payment initiation error:', error);
      return ApiResponse.error(res, error.message || 'Failed to initialize payment', 500);
    }
  }

  private static async initiatePaystackPayment(res: Response, user: any, wallet: any, amount: number, email: string) {
    try {
      const reference = `PAYSTACK_${Date.now()}_${user._id}`;
      
      // Initialize payment with Paystack
      const paymentData = await paystackService.initializeTransaction(
        email,
        amount * 100, // Convert to kobo
        reference
      );
      
      // Note: The callback URL and metadata from the original call are not supported 
      // in the current Paystack service implementation. If you need these features, 
      // you'll need to update the Paystack service to accept them as parameters.
      // The current implementation uses a hardcoded callback URL and metadata.

      // Create a pending transaction
      await Transaction.create({
        user_id: user._id,
        wallet_id: wallet._id,
        type: 'credit',
        amount,
        status: 'pending',
        reference_number: paymentData.data.reference || reference,
        gateway: 'paystack',
        description: 'Wallet funding via Paystack',
        metadata: {
          authorization_url: paymentData.data.authorization_url,
          access_code: paymentData.data.access_code,
          payment_method: 'card'
        }
      });

      return ApiResponse.success(
        res,
        {
          authorization_url: paymentData.data.authorization_url,
          access_code: paymentData.data.access_code,
          reference: paymentData.data.reference || reference,
          amount,
          email
        },
        'Payment initialized successfully'
      );
    } catch (error: any) {
      console.error('Paystack payment error:', error);
      throw new Error(error.message || 'Failed to initialize Paystack payment');
    }
  }

  private static async initiatePayrantPayment(res: Response, user: any, wallet: any, amount: number) {
    // ... existing initiatePayrantPayment implementation ...
  }

  private static async initiateMonnifyPayment(res: Response, user: any, wallet: any, amount: number) {
    // ... existing initiateMonnifyPayment implementation ...
  }

  /**
   * Verify payment status for any supported gateway
   * @param req Express request object with reference parameter
   * @param res Express response object
   */
  static async verifyPayment(req: Request, res: Response) {
    try {
      const { reference } = req.params;
      
      if (!reference) {
        return ApiResponse.error(res, 'Payment reference is required', 400);
      }

      // Find the transaction by reference
      const transaction = await Transaction.findOne({ reference_number: reference });
      
      if (!transaction) {
        return ApiResponse.error(res, 'Transaction not found', 404);
      }

      // Verify payment based on the gateway used
      let verificationResult;
      switch (transaction.gateway) {
        case 'paystack':
          verificationResult = await paystackService.verifyTransaction(reference);
          break;
          
        case 'monnify':
          // For Monnify, we'll just return the transaction status
          // since we don't have a verification endpoint in the service yet
          return ApiResponse.success(res, 'Payment status retrieved', JSON.stringify({
            status: transaction.status,
            reference: transaction.reference_number,
            amount: transaction.amount,
            gateway: transaction.gateway
          }));
          
        case 'payrant':
          // For Payrant, we'll just return the transaction status
          // since we don't have a direct verification endpoint
          return ApiResponse.success(res, 'Payment status retrieved', JSON.stringify({
            status: transaction.status,
            reference: transaction.reference_number,
            amount: transaction.amount,
            gateway: transaction.gateway
          }));
          
        default:
          return ApiResponse.error(res, 'Unsupported payment gateway', 400);
      }

      // Update transaction status if it has changed
      if (verificationResult.status && verificationResult.status !== transaction.status) {
        transaction.status = verificationResult.status;
        
        // If payment is successful, update the wallet balance
        if (verificationResult.status === true && transaction.type === 'credit') {
          const wallet = await Wallet.findById(transaction.wallet_id);
          if (wallet) {
            wallet.balance = (wallet.balance || 0) + transaction.amount;
            await wallet.save();
          }
        }
        
        await transaction.save();
      }

      // Extract all properties except status from verificationResult
      const { status: _, ...restVerification } = verificationResult;
      
      return ApiResponse.success(
        res,
        {
          status: transaction.status,  // Always use transaction status
          reference: transaction.reference_number,
          amount: transaction.amount,
          gateway: transaction.gateway,
          ...restVerification  // Spread all other verification data
        },
        'Payment verification successful'
      );
      
    } catch (error: any) {
      console.error('Payment verification error:', error);
      return ApiResponse.error(res, error.message || 'Failed to verify payment', 500);
    }
  }
}
