// routes/payment.routes.ts
import { Request, Response, Router } from 'express';
import { PaymentController } from '../controllers/payment.controller.js';
import { authenticate } from '../middleware/auth.middleware.js';

const router = Router();

/**
 * @route   POST /api/payment/initiate
 * @desc    Initialize payment for wallet funding (Payrant, Monnify, or Paystack)
 * @access  Private
 * @body    { 
 *   amount: number, 
 *   gateway?: 'payrant' | 'monnify' | 'paystack',
 *   email?: string (required for Paystack)
 * }
 */
router.post('/initiate', authenticate, PaymentController.initiatePayment);

/**
 * @route   GET /api/payment/verify/:reference
 * @desc    Verify payment status (works for all supported gateways)
 * @access  Private
 */
router.get('/verify/:reference', authenticate, PaymentController.verifyPayment);

/**
 * @route   POST /api/payment/webhook/monnify
 * @desc    Handle Monnify webhook for payment confirmation
 * @access  Public (Webhook from Monnify)
 */
router.post('/webhook/monnify', (req: Request, res: Response) => {
  return PaymentController.handleMonnifyWebhook(req, res);
});

/**
 * @route   POST /api/payment/webhook/paystack
 * @desc    Handle Paystack webhook for payment confirmation
 * @access  Public (Webhook from Paystack)
 */
router.post('/webhook/paystack', (req: Request, res: Response) => {
  return PaymentController.handlePaystackWebhook(req, res);
});

/**
 * @route   GET /api/payment/banks
 * @desc    Get list of supported banks (for bank transfers)
 * @access  Private
 */
router.get('/banks', authenticate, PaymentController.getBanks);

export default router;
