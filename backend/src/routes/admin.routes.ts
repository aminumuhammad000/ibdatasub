import { Router } from 'express';
import { AdminController } from '../controllers/admin.controller.js';
import { authMiddleware } from '../middleware/auth.middleware.js';

const router = Router();

// Admin routes
router.post('/login', AdminController.login);
router.get('/dashboard', authMiddleware, AdminController.getDashboardStats);

// User management
router.get('/users', authMiddleware, AdminController.getAllUsers);
router.get('/users/:id', authMiddleware, AdminController.getUserById);
router.put('/users/:id/status', authMiddleware, AdminController.updateUserStatus);
router.put('/users/:id', authMiddleware, AdminController.updateUser);
router.delete('/users/:id', authMiddleware, AdminController.deleteUser);

// Audit logs
router.get('/audit-logs', authMiddleware, AdminController.getAuditLogs);
router.delete('/audit-logs/:id', authMiddleware, AdminController.deleteAuditLog);

export default router;
