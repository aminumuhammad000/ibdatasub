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

      if (gateway === 'payrant') {
        return await PaymentController.initiatePayrantPayment(res, user, wallet, amount);
      } else if (gateway === 'monnify') {
        return await PaymentController.initiateMonnifyPayment(res, user, wallet, amount);
      } else {
        return ApiResponse.error(res, 'Invalid payment gateway', 400);
      }
    } catch (error: any) {
      console.error('Payment initiation error:', error);
      return ApiResponse.error(res, error.message || 'Failed to initialize payment', 500);
    }
  }

  private static async initiatePayrantPayment(res: Response, user: any, wallet: any, amount: number) {
    try {
      const userId = user._id.toString();
      const paymentReference = `TXN_${Date.now()}_${Math.floor(Math.random() * 1000)}`;

      const transaction = await Transaction.create({
        user_id: userId,
        wallet_id: wallet._id,
        type: 'wallet_topup',
        amount: amount,
        fee: 0,
        total_charged: amount,
        status: 'pending',
        reference_number: paymentReference,
        payment_method: 'payrant',
        description: 'Wallet Funding via Payrant',
      });

      // In a real implementation, you would call the Payrant service here
      // const paymentData = await payrantService.initializeCheckout({
      //   email: user.email,
      //   amount: amount,
      //   metadata: {
      //     user_id: userId,
      //     transaction_id: transaction._id,
      //     reference: paymentReference,
      //   },
      // });

      // Mock response for now
      const paymentData = {
        checkout_url: 'https://payrant.com/checkout/mock',
        reference: paymentReference,
        account_number: '1234567890',
        bank_name: 'Mock Bank'
      };

      console.log('Payrant payment initialized for user:', user.email);

      return ApiResponse.success(res, {
        transaction: {
          id: transaction._id,
          reference: paymentReference,
          amount: amount,
          status: 'pending',
        },
        payment: {
          gateway: 'payrant',
          checkoutUrl: paymentData.checkout_url,
          reference: paymentData.reference,
          accountNumber: paymentData.account_number,
          bankName: paymentData.bank_name,
        },
      }, 'Payment initialized successfully with Payrant');
    } catch (error: any) {
      console.error('Payrant payment error:', error);
      throw error;
    }
  }

  private static async initiateMonnifyPayment(res: Response, user: any, wallet: any, amount: number) {
    try {
      const userId = user._id.toString();
      const paymentReference = `MON_${Date.now()}_${Math.floor(Math.random() * 1000)}`;

      const transaction = await Transaction.create({
        user_id: userId,
        wallet_id: wallet._id,
        type: 'wallet_topup',
        amount: amount,
        fee: 0,
        total_charged: amount,
        status: 'pending',
        reference_number: paymentReference,
        payment_method: 'monnify',
        description: 'Wallet Funding via Monnify',
      });

      // In a real implementation, you would call the Monnify service here
      // const paymentData = await monnifyService.initiatePayment({
      //   amount: amount,
      //   customerName: `${user.first_name} ${user.last_name}`,
      //   customerEmail: user.email,
      //   paymentReference: paymentReference,
      //   paymentDescription: `Wallet funding - ${amount} NGN`,
      // });

      // Mock response for now
      const paymentData = {
        checkoutUrl: 'https://monnify.com/checkout/mock',
        transactionReference: `TRX_${Date.now()}`,
        paymentReference: paymentReference,
      };

      console.log('Monnify payment initialized for user:', user.email);

      return ApiResponse.success(res, {
        transaction: {
          id: transaction._id,
          reference: paymentReference,
          amount: amount,
          status: 'pending',
        },
        payment: {
          gateway: 'monnify',
          checkoutUrl: paymentData.checkoutUrl,
          transactionReference: paymentData.transactionReference,
          paymentReference: paymentData.paymentReference,
        },
      }, 'Payment initialized successfully with Monnify');
    } catch (error: any) {
      console.error('Monnify payment error:', error);
      throw error;
    }
  }

  static async verifyPayment(req: AuthRequest, res: Response) {
    try {
      const { reference } = req.params;
      const userId = req.user?.id;

      if (!reference) {
        return ApiResponse.error(res, 'Payment reference is required', 400);
      }

      const transaction = await Transaction.findOne({
        reference_number: reference,
        user_id: userId,
      });

      if (!transaction) {
        return ApiResponse.error(res, 'Transaction not found', 404);
      }

      if (transaction.status === 'successful') {
        return ApiResponse.success(res, {
          status: 'paid',
          transaction: transaction,
        }, 'Payment already verified');
      }

      let paymentStatus;
      let amountPaid = transaction.amount;

      // In a real implementation, you would verify with the payment gateway here
      // For now, we'll simulate a successful payment
      paymentStatus = 'successful';

      if (paymentStatus === 'successful') {
        transaction.status = 'successful';
        transaction.updated_at = new Date();
        await transaction.save();

        if (!userId) {
          return ApiResponse.error(res, 'User ID not found', 400);
        }

        await WalletService.creditWallet(new Types.ObjectId(userId), amountPaid);

        console.log('Payment verified and wallet credited:', userId, amountPaid);

        return ApiResponse.success(res, {
          status: 'paid',
          transaction: transaction,
          amountPaid: amountPaid,
        }, 'Payment verified successfully');
      } else if (paymentStatus === 'failed') {
        transaction.status = 'failed';
        await transaction.save();

        return ApiResponse.error(res, 'Payment failed', 400);
      } else {
        return ApiResponse.success(res, {
          status: 'pending',
          transaction: transaction,
        }, 'Payment is still pending');
      }
    } catch (error: any) {
      console.error('Payment verification error:', error);
      return ApiResponse.error(res, error.message || 'Failed to verify payment', 500);
    }
  }

  static async handlePayrantWebhook(req: Request, res: Response) {
    try {
      const signature = req.headers['x-payrant-signature'] as string;
      const payload = req.body;

      console.log('Received Payrant webhook:', payload.status);

      // In a real implementation, you would verify the webhook signature here
      // if (signature && !payrantService.validateWebhookSignature(payload, signature)) {
      //   console.error('Invalid Payrant webhook signature');
      //   return res.status(401).send('Invalid signature');
      // }

      if (payload.status === 'success' && payload.transaction) {
        const reference = payload.transaction.reference;
        const amount = parseFloat(payload.transaction.amount);

        const transaction = await Transaction.findOne({
          reference_number: reference,
        });

        if (!transaction) {
          console.error('Transaction not found:', reference);
          return res.status(404).send('Transaction not found');
        }

        if (transaction.status === 'successful') {
          console.log('Transaction already processed:', reference);
          return res.status(200).send('Already processed');
        }

        transaction.status = 'successful';
        transaction.updated_at = new Date();
        await transaction.save();

        await WalletService.creditWallet(transaction.user_id.toString(), amount);

        console.log('Payrant webhook processed - Wallet credited:', transaction.user_id, amount);

        return res.status(200).send('OK');
      }

      return res.status(200).send('OK');
    } catch (error: any) {
      console.error('Payrant webhook error:', error);
      return res.status(500).send('Error');
    }
  }

  static async handleMonnifyWebhook(req: Request, res: Response) {
    try {
      const signature = req.headers['monnify-signature'] as string;
      const payload = req.body;

      console.log('Received Monnify webhook:', payload.eventType);

      // In a real implementation, you would verify the webhook signature here
      // if (signature && !monnifyService.validateWebhookSignature(payload, signature)) {
      //   console.error('Invalid Monnify webhook signature');
      //   return res.status(401).send('Invalid signature');
      // }

      if (payload.eventType === 'SUCCESS' && payload.eventData) {
        const reference = payload.eventData.paymentReference;
        const amount = parseFloat(payload.eventData.amountPaid);

        const transaction = await Transaction.findOne({
          reference_number: reference,
        });

        if (!transaction) {
          console.error('Transaction not found:', reference);
          return res.status(404).send('Transaction not found');
        }

        if (transaction.status === 'successful') {
          console.log('Transaction already processed:', reference);
          return res.status(200).send('Already processed');
        }

        transaction.status = 'successful';
        transaction.updated_at = new Date();
        await transaction.save();

        await WalletService.creditWallet(transaction.user_id.toString(), amount);

        console.log('Monnify webhook processed - Wallet credited:', transaction.user_id, amount);

        return res.status(200).send('OK');
      }

      return res.status(200).send('OK');
    } catch (error: any) {
      console.error('Monnify webhook error:', error);
      return res.status(500).send('Error');
    }
  }

      const user = await User.findById(userId);
      if (!user) {
        return ApiResponse.error(res, 'User not found', 404);
      }

      const wallet = await Wallet.findOne({ user_id: userId });
      if (!wallet) {
        return ApiResponse.error(res, 'Wallet not found', 404);
      }

      if (gateway === 'payrant') {
        return await PaymentController.initiatePayrantPayment(res, user, wallet, amount);
      } else if (gateway === 'monnify') {
        return await PaymentController.initiateMonnifyPayment(res, user, wallet, amount);
      } else {
        return ApiResponse.error(res, 'Invalid payment gateway', 400);
      }
    } catch (error: any) {
      console.error('Payment initiation error:', error);
      return ApiResponse.error(res, error.message || 'Failed to initialize payment', 500);
    }
  }

  private static async initiatePayrantPayment(res: Response, user: any, wallet: any, amount: number) {
    try {
      const userId = user._id.toString();
      const paymentReference = payrantService.generatePaymentReference(userId);

      const transaction = await Transaction.create({
        user_id: userId,
        wallet_id: wallet._id,
        type: 'wallet_topup',
        amount: amount,
        fee: 0,
        total_charged: amount,
        status: 'pending',
        reference_number: paymentReference,
        payment_method: 'payrant',
        description: 'Wallet Funding via Payrant',
      });

      const paymentData = await payrantService.initializeCheckout({
        email: user.email,
        amount: amount,
        metadata: {
          user_id: userId,
          transaction_id: transaction._id,
          reference: paymentReference,
        },
      });

      console.log('Payrant payment initialized for user:', user.email);

      return ApiResponse.success(res, {
        transaction: {
          id: transaction._id,
          reference: paymentReference,
          amount: amount,
          status: 'pending',
        },
        payment: {
          gateway: 'payrant',
          checkoutUrl: paymentData.checkout_url,
          reference: paymentData.reference,
          accountNumber: paymentData.account_number,
          bankName: paymentData.bank_name,
        },
      }, 'Payment initialized successfully with Payrant');
    } catch (error: any) {
      console.error('Payrant payment error:', error);
      throw error;
    }
  }

  private static async initiateMonnifyPayment(res: Response, user: any, wallet: any, amount: number) {
    try {
      const userId = user._id.toString();
      const paymentReference = monnifyService.generatePaymentReference(userId);

      const transaction = await Transaction.create({
        user_id: userId,
        wallet_id: wallet._id,
        type: 'wallet_topup',
        amount: amount,
        fee: 0,
        total_charged: amount,
        status: 'pending',
        reference_number: paymentReference,
        payment_method: 'monnify',
        description: 'Wallet Funding via Monnify',
      });

      const paymentData = await monnifyService.initiatePayment({
        amount: amount,
        customerName: `${user.first_name} ${user.last_name}`,
        customerEmail: user.email,
        paymentReference: paymentReference,
        paymentDescription: `Wallet funding - ${amount} NGN`,
      });

      console.log('Monnify payment initialized for user:', user.email);

      return ApiResponse.success(res, {
        transaction: {
          id: transaction._id,
          reference: paymentReference,
          amount: amount,
          status: 'pending',
        },
        payment: {
          gateway: 'monnify',
          checkoutUrl: paymentData.checkoutUrl,
          transactionReference: paymentData.transactionReference,
          paymentReference: paymentData.paymentReference,
        },
      }, 'Payment initialized successfully with Monnify');
    } catch (error: any) {
      console.error('Monnify payment error:', error);
      throw error;
    }
  }

  static async verifyPayment(req: AuthRequest, res: Response) {
    try {
      const { reference } = req.params;
      const userId = req.user?.id;

      if (!reference) {
        return ApiResponse.error(res, 'Payment reference is required', 400);
      }

      const transaction = await Transaction.findOne({
        reference_number: reference,
        user_id: userId,
      });

      if (!transaction) {
        return ApiResponse.error(res, 'Transaction not found', 404);
      }

      if (transaction.status === 'successful') {
        return ApiResponse.success(res, {
          status: 'paid',
          transaction: transaction,
        }, 'Payment already verified');
      }

      let paymentStatus;
      let amountPaid = transaction.amount;

      if (transaction.payment_method === 'payrant') {
        const paymentData = await payrantService.verifyTransaction(reference);
        paymentStatus = paymentData.status;
        if (paymentData.amount) amountPaid = paymentData.amount;
      } else if (transaction.payment_method === 'monnify') {
        const paymentData = await monnifyService.verifyPayment(reference);
        paymentStatus = paymentData.paymentStatus === 'PAID' ? 'successful' : paymentData.paymentStatus.toLowerCase();
        amountPaid = paymentData.amountPaid;
      } else {
        return ApiResponse.error(res, 'Unknown payment method', 400);
      }

      if (paymentStatus === 'successful') {
        transaction.status = 'successful';
        transaction.updated_at = new Date();
        await transaction.save();

        if (!userId) {
          return ApiResponse.error(res, 'User ID not found', 400);
        }

        await WalletService.creditWallet(new Types.ObjectId(userId), amountPaid);

        console.log('Payment verified and wallet credited:', userId, amountPaid);

        return ApiResponse.success(res, {
          status: 'paid',
          transaction: transaction,
          amountPaid: amountPaid,
        }, 'Payment verified successfully');
      } else if (paymentStatus === 'failed') {
        transaction.status = 'failed';
        await transaction.save();

        return ApiResponse.error(res, 'Payment failed', 400);
      } else {
        return ApiResponse.success(res, {
          status: 'pending',
          transaction: transaction,
        }, 'Payment is still pending');
      }
    } catch (error: any) {
      console.error('Payment verification error:', error);
      return ApiResponse.error(res, error.message || 'Failed to verify payment', 500);
    }
  }

  static async handlePayrantWebhook(req: AuthRequest, res: Response) {
    try {
      const signature = req.headers['x-payrant-signature'] as string;
      const payload = req.body;

      console.log('Received Payrant webhook:', payload.status);

      if (signature && !payrantService.validateWebhookSignature(payload, signature)) {
        console.error('Invalid Payrant webhook signature');
        return res.status(401).send('Invalid signature');
      }

      if (payload.status === 'success' && payload.transaction) {
        const accountReference = payload.transaction.metadata?.account_reference;
        
        if (accountReference && accountReference.startsWith('TXN_')) {
          const reference = accountReference;
          const amount = parseFloat(payload.transaction.net_amount);

          const transaction = await Transaction.findOne({
            reference_number: reference,
          });

          if (!transaction) {
            console.error('Transaction not found:', reference);
            return res.status(404).send('Transaction not found');
          }

          if (transaction.status === 'successful') {
            console.log('Transaction already processed:', reference);
            return res.status(200).send('Already processed');
          }

          transaction.status = 'successful';
          transaction.updated_at = new Date();
          await transaction.save();

          await WalletService.creditWallet(transaction.user_id.toString(), amount);

          console.log('Payrant webhook processed - Wallet credited:', transaction.user_id, amount);

          return res.status(200).send('OK');
        }
      }

      return res.status(200).send('OK');
    } catch (error: any) {
      console.error('Payrant webhook error:', error);
      return res.status(500).send('Error');
    }
  }

  static async handleWebhook(req: AuthRequest, res: Response) {
    try {
      const signature = req.headers['monnify-signature'] as string;
      const payload = req.body;

      console.log('Received Monnify webhook:', payload.eventType);

      if (signature && !monnifyService.validateWebhookSignature(payload, signature)) {
        console.error('Invalid webhook signature');
        return res.status(401).send('Invalid signature');
      }

      const eventType = payload.eventType;

      if (eventType === 'SUCCESSFUL_TRANSACTION') {
        const { paymentReference, amountPaid, paidOn } = payload.eventData;

        const transaction = await Transaction.findOne({
          reference_number: paymentReference,
        });

        if (!transaction) {
          console.error('Transaction not found:', paymentReference);
          return res.status(404).send('Transaction not found');
        }

        if (transaction.status === 'successful') {
          console.log('Transaction already processed:', paymentReference);
          return res.status(200).send('Already processed');
        }

        transaction.status = 'successful';
        transaction.updated_at = new Date(paidOn);
        await transaction.save();

        await WalletService.creditWallet(transaction.user_id.toString(), amountPaid);

        console.log('Monnify webhook processed - Wallet credited:', transaction.user_id, amountPaid);

        return res.status(200).send('OK');
      } else if (eventType === 'FAILED_TRANSACTION') {
        const { paymentReference } = payload.eventData;

        const transaction = await Transaction.findOne({
          reference_number: paymentReference,
        });

        if (transaction) {
          transaction.status = 'failed';
          await transaction.save();
          console.log('Transaction marked as failed:', paymentReference);
        }

        return res.status(200).send('OK');
      }

      return res.status(200).send('OK');
    } catch (error: any) {
      console.error('Webhook processing error:', error);
      return res.status(500).send('Error');
    }
  }

  static async getPaymentHistory(req: AuthRequest, res: Response) {
    try {
      const userId = req.user?.id;
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 20;
      const skip = (page - 1) * limit;

      const transactions = await Transaction.find({
        user_id: userId,
        type: 'wallet_topup',
      })
        .sort({ created_at: -1 })
        .skip(skip)
        .limit(limit);

      const total = await Transaction.countDocuments({
        user_id: userId,
        type: 'wallet_topup',
      });

      return ApiResponse.paginated(res, transactions, {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit),
      }, 'Payment history retrieved successfully');
    } catch (error: any) {
      console.error('Get payment history error:', error);
      return ApiResponse.error(res, error.message || 'Failed to get payment history', 500);
    }
  }
}
