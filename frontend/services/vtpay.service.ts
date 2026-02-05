import api from './api';

export interface VirtualAccount {
    id: string;
    accountNumber: string;
    accountName: string;
    bankName: string;
    bankType: string;
    reference: string;
    status: string;
    created_at?: string;
}

export interface Transaction {
    reference: string;
    amount: number;
    type: 'credit' | 'debit';
    description: string;
    date: string;
    status: string;
}

export const vtpayService = {
    /**
     * Get all virtual accounts for the user
     */
    getMyAccounts: async (): Promise<{ success: boolean; data: VirtualAccount[] }> => {
        try {
            const response = await api.get('/payment/vtpay/virtual-account');
            return response.data;
        } catch (error: any) {
            throw error.response?.data || error;
        }
    },

    /**
     * Create a new virtual account
     */
    createAccount: async (bankType: 'fcmb' | 'fidelity' | 'moniepoint'): Promise<{ success: boolean; data: VirtualAccount }> => {
        try {
            const response = await api.post('/payment/vtpay/create-virtual-account', { bankType });
            return response.data;
        } catch (error: any) {
            throw error.response?.data || error;
        }
    },

    /**
     * Get transactions for a specific account
     */
    getAccountTransactions: async (accountNumber: string): Promise<{ success: boolean; data: Transaction[] }> => {
        try {
            const response = await api.get(`/payment/vtpay/virtual-account/${accountNumber}/transactions`);
            return response.data;
        } catch (error: any) {
            throw error.response?.data || error;
        }
    }
};
