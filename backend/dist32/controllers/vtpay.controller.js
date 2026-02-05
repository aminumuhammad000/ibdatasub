import VirtualAccount from '../models/VirtualAccount.js';
import { Transaction, User, Wallet } from '../models/index.js';
import { vtPayService } from '../services/vtpay.service.js';
import { WalletService } from '../services/wallet.service.js';
import { ApiResponse } from '../utils/response.js';
export class VTPayController {
    /**
     * Create a new Virtual Account for the authorized user
     */
    static async createAccount(req, res) {
        try {
            const userSession = req.user;
            if (!userSession) {
                return ApiResponse.error(res, 'User not found', 404);
            }
            const user = await User.findById(userSession.id);
            if (!user) {
                return ApiResponse.error(res, 'User not found in database', 404);
            }
            // Check if user already has a VTPay account
            const existingAccount = await VirtualAccount.findOne({
                user: user._id,
                provider: 'vtpay'
            });
            if (existingAccount) {
                return ApiResponse.success(res, existingAccount, 'Virtual account already exists');
            }
            const { bankType = 'moniepoint' } = req.body;
            const reference = vtPayService.generateReference(user._id.toString());
            // Create account on VTPay
            const vtAccount = await vtPayService.createVirtualAccount({
                bankType,
                accountName: `${user.first_name} ${user.last_name}`,
                email: user.email,
                phone: user.phone_number || '08000000000', // Fallback if missing
                reference
            });
            // Save to local database
            const newAccount = await VirtualAccount.create({
                user: user._id,
                accountNumber: vtAccount.accountNumber,
                accountName: vtAccount.accountName,
                bankName: vtAccount.bankName,
                provider: 'vtpay',
                reference: vtAccount.reference,
                status: 'active',
                metadata: {
                    bankType: vtAccount.bankType,
                    alias: vtAccount.alias,
                    id: vtAccount.id
                }
            });
            return ApiResponse.success(res, newAccount, 'Virtual account created successfully', 201);
        }
        catch (error) {
            console.error('VTPay Create Account Error:', error);
            return ApiResponse.error(res, error.message || 'Failed to create virtual account', 500);
        }
    }
    /**
     * Get User's Virtual Accounts
     */
    static async getMyAccounts(req, res) {
        try {
            const accounts = await VirtualAccount.find({ user: req.user?.id, provider: 'vtpay' });
            return ApiResponse.success(res, accounts, 'Virtual accounts retrieved');
        }
        catch (error) {
            return ApiResponse.error(res, error.message, 500);
        }
    }
    /**
     * Get real-time balance for an account
     */
    static async getAccountBalance(req, res) {
        try {
            const { accountNumber } = req.params;
            // Verify ownership
            const account = await VirtualAccount.findOne({
                user: req.user?.id,
                accountNumber,
                provider: 'vtpay'
            });
            if (!account) {
                return ApiResponse.error(res, 'Account not found or access denied', 404);
            }
            const balanceData = await vtPayService.getAccountBalance(accountNumber);
            return ApiResponse.success(res, balanceData, 'Account balance retrieved');
        }
        catch (error) {
            return ApiResponse.error(res, error.message, 500);
        }
    }
    /**
     * Get transactions for an account
     */
    static async getAccountTransactions(req, res) {
        try {
            const { accountNumber } = req.params;
            // Verify ownership
            const account = await VirtualAccount.findOne({
                user: req.user?.id,
                accountNumber,
                provider: 'vtpay'
            });
            if (!account) {
                return ApiResponse.error(res, 'Account not found or access denied', 404);
            }
            const transactions = await vtPayService.getTransactions(accountNumber);
            return ApiResponse.success(res, transactions, 'Account transactions retrieved');
        }
        catch (error) {
            return ApiResponse.error(res, error.message, 500);
        }
    }
    /**
     * Handle Webhook notifications from VTPay
     */
    static async webhook(req, res) {
        try {
            const payload = req.body;
            console.log('🔔 VTPay Webhook received:', JSON.stringify(payload, null, 2));
            if (payload.event === 'payment.success' && payload.data) {
                const { accountNumber, amount, reference } = payload.data;
                // Find the virtual account locally
                const virtualAccount = await VirtualAccount.findOne({ accountNumber, provider: 'vtpay' });
                if (!virtualAccount) {
                    console.warn(`⚠️ Webhook received for unknown account: ${accountNumber}`);
                    return res.status(200).json({ status: 'ignored', message: 'Account not found' });
                }
                // Check if transaction already processed (idempotency)
                const existingTxn = await Transaction.findOne({ reference_number: reference });
                if (existingTxn) {
                    console.log('🔁 Transaction already processed:', reference);
                    return res.status(200).json({ status: 'success', message: 'Already processed' });
                }
                // Find wallet
                const wallet = await Wallet.findOne({ user_id: virtualAccount.user });
                if (!wallet) {
                    console.error(`❌ Wallet not found for user: ${virtualAccount.user}`);
                    return res.status(200).json({ status: 'error', message: 'Wallet not found' });
                }
                // Fund Wallet using WalletService
                await WalletService.creditWallet(virtualAccount.user, parseFloat(amount));
                // Record Transaction
                await Transaction.create({
                    user_id: virtualAccount.user,
                    wallet_id: wallet._id,
                    type: 'wallet_funding',
                    amount: parseFloat(amount),
                    fee: 0,
                    total_charged: 0,
                    status: 'successful',
                    reference_number: reference,
                    payment_method: 'vtpay_transfer',
                    description: `Bank transfer from ${payload.data.customer || 'Customer'}`
                });
                console.log(`✅ Wallet funded for user ${virtualAccount.user}: ${amount}`);
            }
            return res.status(200).json({ success: true });
        }
        catch (error) {
            console.error('❌ VTPay Webhook Error:', error);
            return res.status(500).json({ success: false, error: error.message });
        }
    }
}
