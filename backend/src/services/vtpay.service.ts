import axios, { AxiosInstance } from 'axios';

interface VTPayConfig {
    apiKey: string;
    baseUrl: string;
}

interface CreateVirtualAccountData {
    bankType: 'fcmb' | 'fidelity' | 'moniepoint';
    accountName: string;
    email: string;
    reference: string;
    phone: string;
}

interface VirtualAccountClientResponse {
    id: string;
    accountNumber: string;
    accountName: string;
    alias: string;
    reference: string;
    bankName: string;
    bankType: string;
    status: string;
}

interface VirtualAccountBalanceResponse {
    balance: number;
    currency: string;
    accountNumber: string;
}

interface VirtualAccountTransaction {
    reference: string;
    amount: number;
    type: 'credit' | 'debit';
    description: string;
    date: string;
    status: string;
}

export class VTPayService {
    private config: VTPayConfig;
    private axiosInstance: AxiosInstance;

    constructor() {
        this.config = {
            apiKey: process.env.VTPAY_API_KEY || '',
            baseUrl: process.env.VTPAY_BASE_URL || 'https://vtpayapi.vtfree.com.ng/api',
        };

        if (!process.env.VTPAY_API_KEY) {
            console.warn('⚠️ VTPAY_API_KEY is not set in environment variables');
        }

        this.axiosInstance = axios.create({
            baseURL: this.config.baseUrl,
            headers: {
                'Content-Type': 'application/json',
                'x-api-key': this.config.apiKey,
            },
        });
    }

    /**
     * Generate a new dedicated virtual account for a customer
     */
    async createVirtualAccount(data: CreateVirtualAccountData): Promise<VirtualAccountClientResponse> {
        try {
            console.log('🏦 Creating VTPay virtual account:', data.reference);

            const response = await this.axiosInstance.post<{
                success: boolean;
                message: string;
                data: VirtualAccountClientResponse;
            }>('/virtual-accounts', data);

            if (response.data.success) {
                console.log('✅ Virtual account created:', response.data.data.accountNumber);
                return response.data.data;
            }

            throw new Error(response.data.message || 'Failed to create virtual account');
        } catch (error: any) {
            console.error('❌ VTPay create account error:', error.response?.data || error.message);
            throw new Error(error.response?.data?.message || 'Failed to create virtual account');
        }
    }

    /**
     * Retrieve a list of all virtual accounts created under your API key
     */
    async getVirtualAccounts(): Promise<VirtualAccountClientResponse[]> {
        try {
            const response = await this.axiosInstance.get<{
                success: boolean;
                data: VirtualAccountClientResponse[];
            }>('/virtual-accounts');

            if (response.data.success) {
                return response.data.data;
            }

            throw new Error('Failed to fetch virtual accounts');
        } catch (error: any) {
            console.error('❌ VTPay fetch accounts error:', error.response?.data || error.message);
            throw new Error(error.response?.data?.message || 'Failed to fetch virtual accounts');
        }
    }

    /**
     * Fetch the current balance of a specific virtual account
     */
    async getAccountBalance(accountNumber: string): Promise<VirtualAccountBalanceResponse> {
        try {
            const response = await this.axiosInstance.get<{
                success: boolean;
                data: VirtualAccountBalanceResponse;
            }>(`/virtual-accounts/${accountNumber}/balance`);

            if (response.data.success) {
                return response.data.data;
            }

            throw new Error('Failed to fetch account balance');
        } catch (error: any) {
            console.error('❌ VTPay fetch balance error:', error.response?.data || error.message);
            throw new Error(error.response?.data?.message || 'Failed to fetch account balance');
        }
    }

    /**
     * Retrieve the transaction history for a specific virtual account
     */
    async getTransactions(accountNumber: string): Promise<VirtualAccountTransaction[]> {
        try {
            const response = await this.axiosInstance.get<{
                success: boolean;
                data: VirtualAccountTransaction[];
            }>(`/virtual-accounts/${accountNumber}/transactions`);

            if (response.data.success) {
                return response.data.data;
            }

            throw new Error('Failed to fetch transactions');
        } catch (error: any) {
            console.error('❌ VTPay fetch transactions error:', error.response?.data || error.message);
            throw new Error(error.response?.data?.message || 'Failed to fetch transactions');
        }
    }

    /**
     * Generate a unique reference for the virtual account
     */
    generateReference(userId: string): string {
        const timestamp = Date.now();
        return `VTP-${userId.substring(0, 8)}-${timestamp}`;
    }
}

export const vtPayService = new VTPayService();
