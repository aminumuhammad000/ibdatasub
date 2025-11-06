import api from './api';

export interface CreateVirtualAccountData {
  documentType: string;
  documentNumber: string;
  virtualAccountName: string;
  customerName: string;
  email: string;
  accountReference: string;
}

export interface VirtualAccountResponse {
  status: string;
  account_no: string;
  virtualAccountName: string;
  virtualAccountNo: string;
  identityType: string;
  licenseNumber: string;
  customerName: string;
  accountReference: string;
}

export interface PayrantWebhookPayload {
  status: string;
  transaction: {
    reference: string;
    amount: number;
    net_amount: number;
    fee: number;
    currency: string;
    timestamp: string;
    user_id: number;
    account_details: {
      account_number: string;
      account_name: string;
    };
    payer_details: {
      account_number: string;
      account_name: string;
      bank_name: string;
    };
    metadata: any;
  };
}

export const payrantService = {
  /**
   * Create a new Payrant virtual account
   */
  createVirtualAccount: async (data: CreateVirtualAccountData): Promise<VirtualAccountResponse> => {
    try {
      console.log('🏦 Creating Payrant virtual account...');
      
      const response = await api.post<VirtualAccountResponse>('/payment/payrant/create-virtual-account', data);
      
      console.log('✅ Virtual account created:', response.data);
      return response.data;
    } catch (error: any) {
      console.error('❌ Failed to create virtual account:', error);
      
      if (error.response?.data) {
        throw error.response.data;
      }
      
      throw {
        success: false,
        message: error.message || 'Failed to create virtual account. Please try again.',
      };
    }
  },

  /**
   * Get user's virtual account details
   */
  getVirtualAccount: async (): Promise<VirtualAccountResponse | null> => {
    try {
      console.log('🔍 Fetching virtual account...');
      
      const response = await api.get<{ success: boolean; data: VirtualAccountResponse | null }>('/payment/payrant/virtual-account');
      
      if (response.data.success && response.data.data) {
        console.log('✅ Virtual account found:', response.data.data);
        return response.data.data;
      }
      
      console.log('ℹ️ No virtual account found');
      return null;
    } catch (error: any) {
      console.error('❌ Failed to fetch virtual account:', error);
      
      // If account doesn't exist, return null instead of throwing
      if (error.response?.status === 404) {
        return null;
      }
      
      throw {
        success: false,
        message: error.message || 'Failed to fetch virtual account.',
      };
    }
  },

  /**
   * Verify webhook signature
   */
  verifyWebhookSignature: (payload: string, signature: string, secret: string): boolean => {
    const crypto = require('crypto');
    const hmac = crypto.createHmac('sha256', secret);
    hmac.update(payload);
    const calculatedSignature = hmac.digest('hex');
    
    return calculatedSignature === signature;
  },
};
