import axios from 'axios';
export class VTPayService {
    config;
    axiosInstance;
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
    async createVirtualAccount(data) {
        try {
            console.log('🏦 Creating VTPay virtual account:', data.reference);
            const response = await this.axiosInstance.post('/virtual-accounts', data);
            if (response.data.success) {
                console.log('✅ Virtual account created:', response.data.data.accountNumber);
                return response.data.data;
            }
            throw new Error(response.data.message || 'Failed to create virtual account');
        }
        catch (error) {
            console.error('❌ VTPay create account error:', error.response?.data || error.message);
            throw new Error(error.response?.data?.message || 'Failed to create virtual account');
        }
    }
    /**
     * Retrieve a list of all virtual accounts created under your API key
     */
    async getVirtualAccounts() {
        try {
            const response = await this.axiosInstance.get('/virtual-accounts');
            if (response.data.success) {
                return response.data.data;
            }
            throw new Error('Failed to fetch virtual accounts');
        }
        catch (error) {
            console.error('❌ VTPay fetch accounts error:', error.response?.data || error.message);
            throw new Error(error.response?.data?.message || 'Failed to fetch virtual accounts');
        }
    }
    /**
     * Fetch the current balance of a specific virtual account
     */
    async getAccountBalance(accountNumber) {
        try {
            const response = await this.axiosInstance.get(`/virtual-accounts/${accountNumber}/balance`);
            if (response.data.success) {
                return response.data.data;
            }
            throw new Error('Failed to fetch account balance');
        }
        catch (error) {
            console.error('❌ VTPay fetch balance error:', error.response?.data || error.message);
            throw new Error(error.response?.data?.message || 'Failed to fetch account balance');
        }
    }
    /**
     * Retrieve the transaction history for a specific virtual account
     */
    async getTransactions(accountNumber) {
        try {
            const response = await this.axiosInstance.get(`/virtual-accounts/${accountNumber}/transactions`);
            if (response.data.success) {
                return response.data.data;
            }
            throw new Error('Failed to fetch transactions');
        }
        catch (error) {
            console.error('❌ VTPay fetch transactions error:', error.response?.data || error.message);
            throw new Error(error.response?.data?.message || 'Failed to fetch transactions');
        }
    }
    /**
     * Generate a unique reference for the virtual account
     */
    generateReference(userId) {
        const timestamp = Date.now();
        return `VTP-${userId.substring(0, 8)}-${timestamp}`;
    }
}
export const vtPayService = new VTPayService();
