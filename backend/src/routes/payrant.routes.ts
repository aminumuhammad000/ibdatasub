// routes/payrant.routes.ts
import { Router } from 'express';
import { PayrantController } from '../controllers/payrant.controller';
import { authenticate } from '../middleware/auth.middleware.js';

const router = Router();

/**
 * @route   POST /api/payment/payrant/create-virtual-account
 * @desc    Create a new Payrant virtual account
 * @access  Private
 * @body    {
 *   documentType: 'nin' | 'bvn',
 *   documentNumber: string,
 *   virtualAccountName: string,
 *   customerName: string,
 *   email: string,
 *   accountReference: string
 * }
 */
router.post('/create-virtual-account', authenticate, PayrantController.createVirtualAccount);

/**
 * @route   GET /api/payment/payrant/virtual-account
 * @desc    Get user's virtual account details
 * @access  Private
 */
router.get('/virtual-account', authenticate, PayrantController.getVirtualAccount);

export default router;
