// utilsvalidators.ts
import Joi from 'joi';

export const userValidation = {
  register: Joi.object({
    email: Joi.string().email().required(),
    phone_number: Joi.string().required(),
    password: Joi.string().min(8).required(),
    first_name: Joi.string().required(),
    last_name: Joi.string().required(),
    referral_code: Joi.string().optional()
  }),
  
  login: Joi.object({
    email: Joi.string().email().required(),
    password: Joi.string().required()
  })
};

export const transactionValidation = {
  create: Joi.object({
    type: Joi.string().valid('airtime_topup', 'data_purchase', 'bill_payment', 'wallet_topup', 'e-pin_purchase').required(),
    amount: Joi.number().positive().required(),
    destination_account: Joi.string().optional(),
    operator_id: Joi.string().optional(),
    plan_id: Joi.string().optional(),
    payment_method: Joi.string().required()
  })
};
