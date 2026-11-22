import type { NextApiRequest, NextApiResponse } from 'next';
import { handleCors } from '../../lib/server/cors';
import { getAuthenticatedUser } from '../../lib/server/authMiddleware';
import { authController } from '../../lib/server/controllers/auth';
import { usersController } from '../../lib/server/controllers/users';
import { walletController } from '../../lib/server/controllers/wallet';
import { transactionsController } from '../../lib/server/controllers/transactions';
import { billPaymentController } from '../../lib/server/controllers/billpayment';
import { paymentController } from '../../lib/server/controllers/payment';
import { notificationsController } from '../../lib/server/controllers/notifications';
import { referralsController } from '../../lib/server/controllers/referrals';
import { supportController } from '../../lib/server/controllers/support';
import { airtimeToCashController } from '../../lib/server/controllers/airtimeToCash';
import { promotionsController } from '../../lib/server/controllers/promotions';
import { adminController } from '../../lib/server/controllers/admin';

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  // Handle CORS & Preflight
  if (handleCors(req, res)) return;

  const rawSlug = req.query.slug;
  const slug = Array.isArray(rawSlug) ? rawSlug : [rawSlug || ''];
  const method = req.method?.toUpperCase();
  const [section, sub, sub2, sub3] = slug;

  // Helper to ensure authenticated user
  async function requireAuth() {
    const user = await getAuthenticatedUser(req);
    if (!user) {
      res.status(401).json({ success: false, message: 'Authentication required. Please log in.' });
      return null;
    }
    return user;
  }

  try {
    // ============================================
    // 1. AUTH ROUTES (/api/auth/...)
    // ============================================
    if (section === 'auth') {
      if (sub === 'register' && method === 'POST') return authController.register(req, res);
      if (sub === 'login' && method === 'POST') return authController.login(req, res);
      if (sub === 'verify-otp' && method === 'POST') return authController.verifyOTP(req, res);
      if (sub === 'resend-otp' && method === 'POST') return authController.resendOTP(req, res);
      if (sub === 'forgot-password' && method === 'POST') return authController.forgotPassword(req, res);
      if (sub === 'verify-email-otp' && method === 'POST') return authController.verifyEmailOTP(req, res);
      if (sub === 'reset-password' && method === 'POST') return authController.resetPassword(req, res);
    }

    // ============================================
    // 2. USERS ROUTES (/api/users/...)
    // ============================================
    if (section === 'users') {
      if (sub === 'profile') {
        const user = await requireAuth();
        if (!user) return;
        if (method === 'GET') return usersController.getProfile(req, res, user);
        if (method === 'PUT') return usersController.updateProfile(req, res, user);
        if (method === 'DELETE') return usersController.deleteProfile(req, res, user);
      }
      if (sub === 'password' && method === 'PUT') {
        const user = await requireAuth();
        if (!user) return;
        return usersController.updatePassword(req, res, user);
      }
      if (sub === 'transaction-pin') {
        const user = await requireAuth();
        if (!user) return;
        if (method === 'POST') return usersController.setTransactionPin(req, res, user);
        if (method === 'PUT') return usersController.updateTransactionPin(req, res, user);
      }
      if (sub === 'kyc' && method === 'POST') {
        const user = await requireAuth();
        if (!user) return;
        return usersController.uploadKYC(req, res, user);
      }
      if (!sub && method === 'GET') {
        return usersController.getAllUsers(req, res);
      }
      if (sub && !sub2) {
        if (method === 'GET') return usersController.getUserById(req, res, sub);
        if (method === 'PUT') return adminController.updateUser(req, res, sub);
        if (method === 'DELETE') return adminController.deleteUser(req, res, sub);
      }
      if (sub && sub2 === 'status' && method === 'PUT') {
        return adminController.updateUserStatus(req, res, sub);
      }
    }

    // ============================================
    // 3. WALLET ROUTES (/api/wallet/...)
    // ============================================
    if (section === 'wallet') {
      const user = await requireAuth();
      if (!user) return;

      if ((!sub || sub === 'balance') && method === 'GET') return walletController.getWallet(req, res, user);
      if (sub === 'fund' && method === 'POST') return walletController.fundWallet(req, res, user);
      if (sub === 'add-money' && method === 'POST') return walletController.addMoney(req, res, user);
      if (sub === 'transactions' && method === 'GET') return walletController.getWalletTransactions(req, res, user);
      if (sub === 'transfer' && method === 'POST') return walletController.transferFunds(req, res, user);
      if (sub === 'adjust' && method === 'PUT') return walletController.adjustBalance(req, res);
    }

    // ============================================
    // 4. TRANSACTIONS ROUTES (/api/transactions/...)
    // ============================================
    if (section === 'transactions') {
      const user = await requireAuth();
      if (!user) return;

      if ((!sub || sub === 'all') && method === 'GET') return transactionsController.getTransactions(req, res, user);
      if (!sub && method === 'POST') return transactionsController.createTransaction(req, res, user);
      if (sub && method === 'GET') return transactionsController.getTransactionById(req, res, sub);
    }

    // ============================================
    // 5. BILL PAYMENT ROUTES (/api/billpayment/...)
    // ============================================
    if (section === 'billpayment') {
      if (sub === 'networks' && method === 'GET') return billPaymentController.getNetworks(req, res);
      if (sub === 'electricity-providers' && method === 'GET') return billPaymentController.getElectricityProviders(req, res);
      if ((sub === 'data-plans' || sub === 'plans') && method === 'GET') return billPaymentController.getDataPlans(req, res);

      // Authenticated purchases
      const user = await requireAuth();
      if (!user) return;

      if ((sub === 'airtime' || sub === 'purchase-airtime') && method === 'POST') return billPaymentController.purchaseAirtime(req, res, user);
      if ((sub === 'data' || sub === 'purchase-data') && method === 'POST') return billPaymentController.purchaseData(req, res, user);
      if (sub === 'cable' && sub2 === 'verify' && method === 'POST') return billPaymentController.verifyCableAccount(req, res);
      if (sub === 'cable' && sub2 === 'purchase' && method === 'POST') return billPaymentController.purchaseCableTV(req, res, user);
      if (sub === 'electricity' && sub2 === 'verify' && method === 'POST') return billPaymentController.verifyElectricityMeter(req, res);
      if (sub === 'electricity' && sub2 === 'purchase' && method === 'POST') return billPaymentController.purchaseElectricity(req, res, user);
      if (sub === 'exampin' && method === 'POST') return billPaymentController.purchaseExamPin(req, res, user);
      if (sub === 'transaction' && sub2 && method === 'GET') return billPaymentController.getTransactionStatus(req, res, sub2);
    }

    // ============================================
    // 6. PAYMENT ROUTES (/api/payment/...)
    // ============================================
    if (section === 'payment') {
      if (sub === 'gateway-settings') {
        if (method === 'GET') return paymentController.getGatewaySettings(req, res);
        if (method === 'PUT') return paymentController.updateGatewaySettings(req, res);
      }

      const user = await requireAuth();
      if (!user) return;

      if (sub === 'initiate' && method === 'POST') return paymentController.initiatePayment(req, res, user);
      if (sub === 'verify' && sub2 && method === 'GET') return paymentController.verifyPayment(req, res, sub2);
      if (sub === 'history' && method === 'GET') return paymentController.getPaymentHistory(req, res, user);

      // Payrant Virtual Account
      if ((sub === 'payrant' && sub2 === 'create-virtual-account') || (sub === 'virtual-account' && method === 'POST')) {
        return paymentController.createPayrantVirtualAccount(req, res, user);
      }
      if ((sub === 'payrant' && sub2 === 'virtual-account') || (sub === 'virtual-account' && method === 'GET')) {
        return paymentController.getPayrantVirtualAccount(req, res, user);
      }

      // VTStack Virtual Account
      if (sub === 'vtstack' && sub2 === 'create-virtual-account') {
        return paymentController.createVTStackVirtualAccount(req, res, user);
      }
      if (sub === 'vtstack' && sub2 === 'virtual-account') {
        return paymentController.getVTStackVirtualAccount(req, res, user);
      }
    }

    // ============================================
    // 7. NOTIFICATIONS ROUTES (/api/notifications/...)
    // ============================================
    if (section === 'notifications') {
      const user = await requireAuth();
      if (!user) return;

      if (!sub && method === 'GET') return notificationsController.getNotifications(req, res, user);
      if (!sub && method === 'DELETE') return notificationsController.deleteAllNotifications(req, res, user);
      if (sub === 'read-all' && method === 'PUT') return notificationsController.markAllAsRead(req, res, user);
      if (sub && !sub2) {
        if (method === 'GET') return notificationsController.getNotificationById(req, res, sub);
        if (method === 'DELETE') return notificationsController.deleteNotification(req, res, sub);
      }
      if (sub && sub2 === 'read' && method === 'PUT') {
        return notificationsController.markAsRead(req, res, sub);
      }
    }

    // ============================================
    // 8. PROMOTIONS ROUTES (/api/promotions/...)
    // ============================================
    if (section === 'promotions') {
      if (!sub && method === 'GET') return promotionsController.getActivePromotions(req, res);
      if (sub === 'validate' && method === 'POST') return promotionsController.validatePromoCode(req, res);
      if (sub === 'apply' && method === 'POST') return promotionsController.applyPromotion(req, res);
      if (sub && method === 'GET') return promotionsController.getPromotionById(req, res, sub);
    }

    // ============================================
    // 9. REFERRALS ROUTES (/api/referrals/...)
    // ============================================
    if (section === 'referrals') {
      if (sub === 'settings' && method === 'GET') return referralsController.getSettings(req, res);
      if (sub === 'stats' && method === 'GET') {
        const user = await requireAuth();
        if (!user) return;
        return referralsController.getStats(req, res, user);
      }
    }

    // ============================================
    // 10. SUPPORT ROUTES (/api/support & /api/support-content)
    // ============================================
    if (section === 'support-content' && method === 'GET') {
      return supportController.getSupportContent(req, res);
    }
    if (section === 'support') {
      const user = await requireAuth();
      if (!user) return;

      if (!sub) {
        if (method === 'POST') return supportController.createTicket(req, res, user);
        if (method === 'GET') return supportController.getTickets(req, res, user);
      }
      if (sub && !sub2) {
        if (method === 'GET') return supportController.getTicketById(req, res, sub, user);
        if (method === 'PUT') return supportController.updateTicket(req, res, sub);
        if (method === 'DELETE') return supportController.deleteTicket(req, res, sub);
      }
      if (sub && sub2 === 'status' && method === 'PUT') {
        return supportController.closeTicket(req, res, sub);
      }
    }

    // ============================================
    // 11. AIRTIME TO CASH ROUTES (/api/airtime-to-cash/...)
    // ============================================
    if (section === 'airtime-to-cash') {
      if (sub === 'settings' && method === 'GET') return airtimeToCashController.getSettings(req, res);

      const user = await requireAuth();
      if (!user) return;

      if (sub === 'submit' && method === 'POST') return airtimeToCashController.submitRequest(req, res, user);
      if (sub === 'history' && method === 'GET') return airtimeToCashController.getMyRequests(req, res, user);
    }

    // ============================================
    // 12. ADMIN ROUTES (/api/admin/...)
    // ============================================
    if (section === 'admin') {
      if (sub === 'login' && method === 'POST') return adminController.login(req, res);
      if (sub === 'dashboard' && method === 'GET') return adminController.dashboard(req, res);
      if (sub === 'users') {
        if (!sub2 && method === 'GET') return adminController.getUsers(req, res);
        if (sub2 && !sub3) {
          if (method === 'PUT') return adminController.updateUser(req, res, sub2);
          if (method === 'DELETE') return adminController.deleteUser(req, res, sub2);
        }
        if (sub2 && sub3 === 'status' && method === 'PUT') {
          return adminController.updateUserStatus(req, res, sub2);
        }
      }
      if (sub === 'audit-logs') {
        if (!sub2 && method === 'GET') return adminController.getAuditLogs(req, res);
        if (sub2 && method === 'DELETE') return adminController.deleteAuditLog(req, res, sub2);
      }
      if (sub === 'notifications' && sub2 === 'broadcast' && method === 'POST') {
        return adminController.broadcastNotification(req, res);
      }
    }

    // Route not found fallback
    return res.status(404).json({
      success: false,
      message: `API route /api/${slug.join('/')} [${method}] not found`,
    });
  } catch (error: any) {
    console.error(`API Error on /api/${slug.join('/')}:`, error);
    return res.status(500).json({
      success: false,
      message: error.message || 'Internal server error',
    });
  }
}
