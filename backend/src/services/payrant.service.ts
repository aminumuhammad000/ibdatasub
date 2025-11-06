// services/payrant.service.ts
import axios, { AxiosInstance } from 'axios';
import * as crypto from 'crypto';

interface PayrantConfig {
  apiKey: string;
  webhookSecret: string;
  baseUrl: string;
}

interface CreateVirtualAccountData {
  documentType: 'nin' | 'bvn';
  documentNumber: string;
  virtualAccountName: string;
  customerName: string;
  email: string;
  accountReference: string;
}

interface VirtualAccountResponse {
  status: string;
  account_no: string;
  virtualAccountName: string;
  virtualAccountNo: string;
  identityType: string;
  licenseNumber: string;
  customerName: string;
  accountReference: string;
}

interface InitializeCheckoutData {
  email: string;
  amount: number;
  callback_url?: string;
  webhook_url?: string;
  metadata?: any;
}

interface CheckoutResponse {
  status: boolean;
  message: string;
  data: {
    reference: string;
    checkout_url: string;
    amount: number;
    email: string;
    account_number: string;
    bank_name: string;
    status: string;
  };
}

interface VerifyTransactionResponse {
  status: boolean;
  data: {
    reference: string;
    amount: number;
    email: string;
    account_number: string;
    bank_name: string;
    status: 'successful' | 'pending' | 'failed';
    paid_at?: string;
  };
  message?: string;
}

export class PayrantService {
  private config: PayrantConfig;
  private axiosInstance: AxiosInstance;

  constructor() {
    this.config = {
      apiKey: process.env.PAYRANT_API_KEY || '',
      webhookSecret: process.env.PAYRANT_WEBHOOK_SECRET || '',
      baseUrl: process.env.PAYRANT_BASE_URL || 'https://api-core.payrant.com',
    };

    this.axiosInstance = axios.create({
      baseURL: this.config.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.config.apiKey}`,
      },
    });
  }

  /**
   * Create a virtual account for a user
   */
  async createVirtualAccount(data: CreateVirtualAccountData): Promise<VirtualAccountResponse> {
    try {
      console.log('🏦 Creating Payrant virtual account for:', data.email);

      const response = await this.axiosInstance.post<VirtualAccountResponse>(
        '/palmpay/',
        data
      );

      console.log('✅ Virtual account created:', response.data.account_no);
      return response.data;
    } catch (error: any) {
      console.error('❌ Payrant create virtual account error:', error.response?.data || error.message);
      throw new Error(error.response?.data?.message || 'Failed to create virtual account');
    }
  }

  /**
   * Initialize checkout transaction
   */
  async initializeCheckout(data: InitializeCheckoutData): Promise<CheckoutResponse['data']> {
    try {
      console.log('💳 Initializing Payrant checkout:', data.email, data.amount);

      // Use transaction API endpoint
      const response = await axios.post<CheckoutResponse>(
        'https://payrant.com/api-core/transaction/api.php?action=initialize',
        {
          email: data.email,
          amount: data.amount,
          callback_url: data.callback_url || `${process.env.FRONTEND_URL}/payment/callback`,
          webhook_url: data.webhook_url || `${process.env.BACKEND_URL || 'http://192.168.43.204:5000'}/api/payment/payrant/webhook`,
          metadata: data.metadata || {},
        },
        {
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${this.config.apiKey}`,
          },
        }
      );

      if (response.data.status) {
        console.log('✅ Checkout initialized:', response.data.data.reference);
        return response.data.data;
      }

      throw new Error(response.data.message || 'Failed to initialize checkout');
    } catch (error: any) {
      console.error('❌ Payrant initialize checkout error:', error.response?.data || error.message);
      throw new Error(error.response?.data?.message || 'Failed to initialize checkout');
    }
  }

  /**
   * Verify transaction status
   */
  async verifyTransaction(reference: string): Promise<VerifyTransactionResponse['data']> {
    try {
      console.log('🔍 Verifying Payrant transaction:', reference);

      const response = await axios.get<VerifyTransactionResponse>(
        `https://payrant.com/api-core/transaction/api.php?action=verify&reference=${reference}`,
        {
          headers: {
            'Authorization': `Bearer ${this.config.apiKey}`,
          },
        }
      );

      if (response.data.status) {
        console.log('✅ Transaction verified:', response.data.data.status);
        return response.data.data;
      }

      throw new Error(response.data.message || 'Transaction not found');
    } catch (error: any) {
      console.error('❌ Payrant verify transaction error:', error.response?.data || error.message);
      throw new Error(error.response?.data?.message || 'Failed to verify transaction');
    }
  }

  /**
   * Validate webhook signature
   */
  validateWebhookSignature(payload: any, signature: string): boolean {
    try {
      const hash = crypto
        .createHmac('sha256', this.config.webhookSecret)
        .update(JSON.stringify(payload))
        .digest('hex');

      return hash === signature;
    } catch (error) {
      console.error('❌ Webhook signature validation error:', error);
      return false;
    }
  }

  /**
   * Generate unique account reference
   */
  generateAccountReference(userId: string): string {
    const timestamp = Date.now().toString(36);
    const random = Math.random().toString(36).substring(2, 8);
    return `${userId.substring(0, 8)}-${timestamp}-${random}`;
  }

  /**
   * Generate payment reference
   */
  generatePaymentReference(userId: string): string {
    const timestamp = Date.now();
    const random = Math.floor(Math.random() * 10000);
    return `PAY-${userId.substring(0, 8)}-${timestamp}-${random}`;
  }

  /**
   * Validate account name before transfer
   */
  async validateAccount(bankCode: string, accountNumber: string): Promise<any> {
    try {
      console.log('🔍 Validating account:', bankCode, accountNumber);

      const response = await this.axiosInstance.post('/payout/validate_account/', {
        bank_code: bankCode,
        account_number: accountNumber,
      });

      if (response.data.status === 'success') {
        console.log('✅ Account validated:', response.data.data.account_name);
        return response.data.data;
      }

      throw new Error(response.data.message || 'Account validation failed');
    } catch (error: any) {
      console.error('❌ Account validation error:', error.response?.data || error.message);
      throw new Error(error.response?.data?.message || 'Failed to validate account');
    }
  }

  /**
   * Get list of supported banks
   */
  async getBanksList(): Promise<any[]> {
    try {
      const response = await this.axiosInstance.get('/payout/banks_list/');

      if (response.data.status === 'success') {
        return response.data.data.banks;
      }

      return [];
    } catch (error: any) {
      console.error('❌ Get banks list error:', error.response?.data || error.message);
      return [];
    }
  }

  /**
   * Initiate bank transfer/payout
   */
  async initiateTransfer(data: {
    bank_code: string;
    account_number: string;
    account_name: string;
    amount: number;
    description?: string;
    notify_url?: string;
  }): Promise<any> {
    try {
      console.log('💸 Initiating transfer:', data.amount, 'to', data.account_number);

      const response = await this.axiosInstance.post('/payout/transfer', {
        ...data,
        notify_url: data.notify_url || `${process.env.BACKEND_URL || 'http://192.168.43.204:5000'}/api/payment/payrant/transfer-webhook`,
      });

      if (response.data.status === 'success') {
        console.log('✅ Transfer initiated:', response.data.data.reference);
        return response.data.data;
      }

      throw new Error(response.data.message || 'Transfer failed');
    } catch (error: any) {
      console.error('❌ Transfer initiation error:', error.response?.data || error.message);
      throw new Error(error.response?.data?.message || 'Failed to initiate transfer');
    }
  }
}

export const payrantService = new PayrantService();
