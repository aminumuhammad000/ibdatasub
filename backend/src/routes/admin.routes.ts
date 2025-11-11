import { Router } from 'express';
import { AdminController } from '../controllers/admin.controller.js';
import AdminPricingController from '../controllers/admin_pricing.controller.js';
import { authMiddleware } from '../middleware/auth.middleware.js';

const router = Router();

// Admin routes
router.post('/login', AdminController.login);
router.get('/dashboard', authMiddleware, AdminController.getDashboardStats);

// Admin user management
router.post('/admins', authMiddleware, AdminController.createAdminUser);
router.get('/admins', authMiddleware, AdminController.getAllAdmins);

// User management
router.get('/users', authMiddleware, AdminController.getAllUsers);
router.get('/users/:id', authMiddleware, AdminController.getUserById);
router.put('/users/:id/status', authMiddleware, AdminController.updateUserStatus);
router.put('/users/:id', authMiddleware, AdminController.updateUser);
router.delete('/users/:id', authMiddleware, AdminController.deleteUser);

// Wallet management
router.post('/wallet/credit', authMiddleware, AdminController.creditUserWallet);

// Audit logs
router.get('/audit-logs', authMiddleware, AdminController.getAuditLogs);
router.delete('/audit-logs/:id', authMiddleware, AdminController.deleteAuditLog);

// Pricing management
router.get('/pricing', authMiddleware, AdminPricingController.getAllPlans);
router.get('/pricing/provider/:providerId', authMiddleware, AdminPricingController.getPlansByProvider);
router.get('/pricing/:id', authMiddleware, AdminPricingController.getPlanById);
router.post('/pricing', authMiddleware, AdminPricingController.createPlan);
router.put('/pricing/:id', authMiddleware, AdminPricingController.updatePlan);
router.delete('/pricing/:id', authMiddleware, AdminPricingController.deletePlan);
router.post('/pricing/bulk-import', authMiddleware, AdminPricingController.bulkImportPlans);

export default router;
