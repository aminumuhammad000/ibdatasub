// controllers/billpayment.controller.ts
import { NextFunction, Request, Response } from 'express';
import { Transaction } from '../models/index.js';
import topupmateService from '../services/topupmate.service.js';
import { WalletService } from '../services/wallet.service.js';
import { AuthRequest } from '../types/index.js';
import { normalizeNetwork } from '../utils/network.js';
import { ApiResponse } from '../utils/response.js';

export class BillPaymentController {
  // Get networks
  async getNetworks(req: Request, res: Response, next: NextFunction) {
    try {
      const networks = await topupmateService.getNetworks();
      return ApiResponse.success(res, 'Networks retrieved successfully', networks.response);
    } catch (error) {
      next(error);
    }
  }

  // Get data plans
  async getDataPlans(req: Request, res: Response, next: NextFunction) {
    try {
      const plans = await topupmateService.getDataPlans();
      return ApiResponse.success(res, 'Data plans retrieved successfully', plans.response);
    } catch (error) {
      next(error);
    }
  }

  // Get cable providers
  async getCableProviders(req: Request, res: Response, next: NextFunction) {
    try {
      const providers = await topupmateService.getCableProviders();
      return ApiResponse.success(res, 'Cable providers retrieved successfully', providers.response);
    } catch (error) {
      next(error);
    }
  }

  // Get electricity providers
  async getElectricityProviders(req: Request, res: Response, next: NextFunction) {
    try {
      const providers = await topupmateService.getElectricityProviders();
      return ApiResponse.success(res, 'Electricity providers retrieved successfully', providers.response);
    } catch (error) {
      next(error);
    }
  }

  // Get exam pin providers
  async getExamPinProviders(req: Request, res: Response, next: NextFunction) {
    try {
      const providers = await topupmateService.getExamPinProviders();
      return ApiResponse.success(res, 'Exam pin providers retrieved successfully', providers.response);
    } catch (error) {
      next(error);
    }
  }

  // Purchase airtime
  async purchaseAirtime(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { network, phone, amount, airtime_type = 'VTU', ported_number = true } = req.body;
      const userId = req.user?.id;

      // Normalize network input to provider ID
      const providerId = normalizeNetwork(network);
      if (!providerId) {
        return ApiResponse.error(res, 'Invalid network. Must be: mtn, airtel, glo, or 9mobile', 400);
      }

      // Validate user balance
      const wallet = await WalletService.getWalletByUserId(userId);
      if (wallet.balance < parseFloat(amount)) {
        return ApiResponse.error(res, 'Insufficient wallet balance', 400);
      }

      // Generate reference
      const ref = topupmateService.generateReference('AIRTIME');

      // Get wallet for wallet_id
      const walletData = await WalletService.getWalletByUserId(userId);

      // Deduct from wallet
      await WalletService.debit(userId, parseFloat(amount), 'Airtime purchase');

      // Create transaction record
      const transaction = await Transaction.create({
        user_id: userId,
        wallet_id: walletData._id,
        type: 'airtime_topup',
        amount: parseFloat(amount),
        total_charged: parseFloat(amount),
        reference_number: ref,
        payment_method: 'wallet',
        status: 'pending',
        destination_account: phone,
        description: `Airtime purchase - ${network.toUpperCase()} - ${phone}`,
      });

      try {
        // Purchase airtime using normalized network ID
        const result = await topupmateService.purchaseAirtime({
          network: String(providerId),
          phone: String(phone),
          ref,
          airtime_type,
          ported_number,
          amount: String(amount),
        });

        // Update transaction status
        if (result.status === 'success') {
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'successful', 
            updated_at: new Date()
          });
          return ApiResponse.success(res, 'Airtime purchase successful', {
            transaction,
            provider_response: result,
          });
        } else {
          // Refund user if failed
          await WalletService.credit(userId, parseFloat(amount), 'Airtime purchase refund');
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'failed', 
            error_message: result.msg || 'Unknown error',
            updated_at: new Date()
          });
          console.error('❌ Airtime purchase failed - TopUpMate Response:', JSON.stringify(result, null, 2));
          return ApiResponse.error(res, `Airtime purchase failed: ${result.msg || 'Unknown error'}`, 400);
        }
      } catch (error: any) {
        // Refund user on error
        await WalletService.credit(userId, parseFloat(amount), 'Airtime purchase refund');
        await Transaction.findByIdAndUpdate(transaction._id, { 
          status: 'failed', 
          error_message: error.message,
          updated_at: new Date()
        });
        console.error('❌ Airtime purchase error:', error);
        throw error;
      }
    } catch (error) {
      next(error);
    }
  }

  // Purchase data
  async purchaseData(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { network, phone, plan, ported_number = true } = req.body;
      const userId = req.user?.id;

      // Normalize network input to provider ID
      const providerId = normalizeNetwork(network);
      if (!providerId) {
        return ApiResponse.error(res, 'Invalid network. Must be: mtn, airtel, glo, or 9mobile', 400);
      }

      // Get plan details to determine amount
      const plans = await topupmateService.getDataPlans();
      const selectedPlan = plans.response?.find((p: any) => p.planid === plan);
      
      if (!selectedPlan) {
        return ApiResponse.error(res, 'Invalid plan selected', 400);
      }

      const amount = parseFloat(selectedPlan.price);

      // Validate user balance
      const wallet = await WalletService.getWalletByUserId(userId);
      if (wallet.balance < amount) {
        return ApiResponse.error(res, 'Insufficient wallet balance', 400);
      }

      // Generate reference
      const ref = topupmateService.generateReference('DATA');

      // Get wallet for wallet_id
      const walletData = await WalletService.getWalletByUserId(userId);

      // Deduct from wallet
      await WalletService.debit(userId, amount, 'Data purchase');

      // Create transaction record
      const transaction = await Transaction.create({
        user_id: userId,
        wallet_id: walletData._id,
        type: 'data_purchase',
        amount,
        total_charged: amount,
        reference_number: ref,
        payment_method: 'wallet',
        status: 'pending',
        destination_account: phone,
        description: `Data purchase - ${network.toUpperCase()} - ${phone}`,
        plan_id: plan
      });

      try {
        // Purchase data using normalized network ID
        const result = await topupmateService.purchaseData({
          network: String(providerId),
          phone: String(phone),
          ref,
          plan: String(plan),
          ported_number,
        });

        // Update transaction status
        if (result.status === 'success') {
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'successful', 
            updated_at: new Date()
          });
          return ApiResponse.success(res, 'Data purchase successful', {
            transaction,
            provider_response: result,
          });
        } else {
          // Refund user if failed
          await WalletService.credit(userId, amount, 'Data purchase refund');
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'failed', 
            error_message: result.msg || 'Unknown error',
            updated_at: new Date()
          });
          return ApiResponse.error(res, 'Data purchase failed', 400);
        }
      } catch (error: any) {
        // Refund user on error
        await WalletService.credit(userId, amount, 'Data purchase refund');
        await Transaction.findByIdAndUpdate(transaction._id, { 
          status: 'failed', 
          error_message: error.message,
          updated_at: new Date()
        });
        throw error;
      }
    } catch (error) {
      next(error);
    }
  }

  // Verify cable account
  async verifyCableAccount(req: Request, res: Response, next: NextFunction) {
    try {
      const { provider, iucnumber } = req.body;

      const result = await topupmateService.verifyCableAccount({
        provider: String(provider),
        iucnumber: String(iucnumber),
      });

      if (result.status === 'success') {
        return ApiResponse.success(res, 'Account verification successful', {
          customer_name: result.Customer_Name,
          iucnumber,
        });
      } else {
        return ApiResponse.error(res, 'Account verification failed', 400);
      }
    } catch (error) {
      next(error);
    }
  }

  // Purchase cable TV
  async purchaseCableTV(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { provider, iucnumber, plan, subtype = 'renew', phone } = req.body;
      const userId = req.user?.id;

      // Get plan details
      const plans = await topupmateService.getCableTVPlans();
      const selectedPlan = plans.response?.find((p: any) => p.id === plan);
      
      if (!selectedPlan) {
        return ApiResponse.error(res, 'Invalid plan selected', 400);
      }

      const amount = parseFloat(selectedPlan.price);

      // Validate user balance
      const wallet = await WalletService.getWalletByUserId(userId);
      if (wallet.balance < amount) {
        return ApiResponse.error(res, 'Insufficient wallet balance', 400);
      }

      // Generate reference
      const ref = topupmateService.generateReference('CABLE');

      // Deduct from wallet
      await WalletService.debit(userId, amount, 'Cable TV purchase');

      // Create transaction record
      const transaction = await Transaction.create({
        user_id: userId,
        type: 'cable',
        amount,
        reference: ref,
        status: 'pending',
        metadata: { provider, iucnumber, plan: selectedPlan, subtype },
      });

      try {
        // Purchase cable TV
        const result = await topupmateService.purchaseCableTV({
          provider,
          iucnumber,
          plan,
          ref,
          subtype,
          phone,
        });

        // Update transaction status
        if (result.status === 'success') {
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'completed', 
            response: result 
          });
          return ApiResponse.success(res, 'Cable TV purchase successful', {
            transaction,
            provider_response: result,
          });
        } else {
          // Refund user if failed
          await WalletService.credit(userId, amount, 'Cable TV purchase refund');
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'failed', 
            response: result 
          });
          return ApiResponse.error(res, 'Cable TV purchase failed', 400);
        }
      } catch (error: any) {
        // Refund user on error
        await WalletService.credit(userId, amount, 'Cable TV purchase refund');
        await Transaction.findByIdAndUpdate(transaction._id, { 
          status: 'failed', 
          response: { error: error.message } 
        });
        throw error;
      }
    } catch (error) {
      next(error);
    }
  }

  // Verify electricity meter
  async verifyElectricityMeter(req: Request, res: Response, next: NextFunction) {
    try {
      const { provider, meternumber, metertype } = req.body;

      const result = await topupmateService.verifyElectricityMeter({
        provider,
        meternumber,
        metertype,
      });

      if (result.status === 'success') {
        return ApiResponse.success(res, 'Meter verification successful', {
          customer_name: result.Customer_Name,
          meternumber,
        });
      } else {
        return ApiResponse.error(res, 'Meter verification failed', 400);
      }
    } catch (error) {
      next(error);
    }
  }

  // Purchase electricity
  async purchaseElectricity(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { provider, meternumber, amount, metertype, phone } = req.body;
      const userId = req.user?.id;

      // Validate user balance
      const wallet = await WalletService.getWalletByUserId(userId);
      if (wallet.balance < parseFloat(amount)) {
        return ApiResponse.error(res, 'Insufficient wallet balance', 400);
      }

      // Generate reference
      const ref = topupmateService.generateReference('ELECTRIC');

      // Deduct from wallet
      await WalletService.debit(userId, parseFloat(amount), 'Electricity purchase');

      // Create transaction record
      const transaction = await Transaction.create({
        user_id: userId,
        type: 'electricity',
        amount: parseFloat(amount),
        reference: ref,
        status: 'pending',
        metadata: { provider, meternumber, metertype },
      });

      try {
        // Purchase electricity
        const result = await topupmateService.purchaseElectricity({
          provider,
          meternumber,
          amount,
          metertype,
          phone,
          ref,
        });

        // Update transaction status
        if (result.status === 'success') {
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'completed', 
            response: result 
          });
          return ApiResponse.success(res, 'Electricity purchase successful', {
            transaction,
            token: result.token,
            provider_response: result,
          });
        } else {
          // Refund user if failed
          await WalletService.credit(userId, parseFloat(amount), 'Electricity purchase refund');
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'failed', 
            response: result 
          });
          return ApiResponse.error(res, 'Electricity purchase failed', 400);
        }
      } catch (error: any) {
        // Refund user on error
        await WalletService.credit(userId, parseFloat(amount), 'Electricity purchase refund');
        await Transaction.findByIdAndUpdate(transaction._id, { 
          status: 'failed', 
          response: { error: error.message } 
        });
        throw error;
      }
    } catch (error) {
      next(error);
    }
  }

  // Purchase exam pin
  async purchaseExamPin(req: AuthRequest, res: Response, next: NextFunction) {
    try {
      const { provider, quantity } = req.body;
      const userId = req.user?.id;

      // Get provider details
      const providers = await topupmateService.getExamPinProviders();
      const selectedProvider = providers.response?.find((p: any) => p.id === provider);
      
      if (!selectedProvider) {
        return ApiResponse.error(res, 'Invalid provider selected', 400);
      }

      const amount = parseFloat(selectedProvider.price) * parseInt(quantity);

      // Validate user balance
      const wallet = await WalletService.getWalletByUserId(userId);
      if (wallet.balance < amount) {
        return ApiResponse.error(res, 'Insufficient wallet balance', 400);
      }

      // Generate reference
      const ref = topupmateService.generateReference('EXAMPIN');

      // Deduct from wallet
      await WalletService.debit(userId, amount, 'Exam pin purchase');

      // Create transaction record
      const transaction = await Transaction.create({
        user_id: userId,
        type: 'exampin',
        amount,
        reference: ref,
        status: 'pending',
        metadata: { provider: selectedProvider, quantity },
      });

      try {
        // Purchase exam pin
        const result = await topupmateService.purchaseExamPin({
          provider,
          quantity,
          ref,
        });

        // Update transaction status
        if (result.status === 'success') {
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'completed', 
            response: result 
          });
          return ApiResponse.success(res, 'Exam pin purchase successful', {
            transaction,
            pins: result.pins || result.pin,
            provider_response: result,
          });
        } else {
          // Refund user if failed
          await WalletService.credit(userId, amount, 'Exam pin purchase refund');
          await Transaction.findByIdAndUpdate(transaction._id, { 
            status: 'failed', 
            response: result 
          });
          return ApiResponse.error(res, 'Exam pin purchase failed', 400);
        }
      } catch (error: any) {
        // Refund user on error
        await WalletService.credit(userId, amount, 'Exam pin purchase refund');
        await Transaction.findByIdAndUpdate(transaction._id, { 
          status: 'failed', 
          response: { error: error.message } 
        });
        throw error;
      }
    } catch (error) {
      next(error);
    }
  }

  // Get transaction status
  async getTransactionStatus(req: Request, res: Response, next: NextFunction) {
    try {
      const { reference } = req.params;

      const result = await topupmateService.getTransactionStatus(reference);

      if (result.status === 'success') {
        return ApiResponse.success(res, 'Transaction status retrieved', result.response);
      } else {
        return ApiResponse.error(res, 'Failed to retrieve transaction status', 400);
      }
    } catch (error) {
      next(error);
    }
  }
}

export default new BillPaymentController();
