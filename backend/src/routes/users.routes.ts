import { Router } from 'express';
import { UserController } from '../controllers/user.controller.js';
import { authMiddleware } from '../middleware/auth.middleware.js';

const router = Router();

// User routes (protected)
router.get('/profile', authMiddleware, UserController.getProfile);
router.put('/profile', authMiddleware, UserController.updateProfile);
router.delete('/profile', authMiddleware, UserController.deleteProfile);
router.post('/kyc', authMiddleware, UserController.uploadKYC);

// Admin routes for user management
router.get('/', authMiddleware, UserController.getAllUsers);
router.get('/:id', authMiddleware, UserController.getUserById);
router.put('/:id', authMiddleware, UserController.updateUser);
router.delete('/:id', authMiddleware, UserController.deleteUser);

export default router;
