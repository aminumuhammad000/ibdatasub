// middleware/validation.middleware.ts
import { Request, Response, NextFunction } from 'express';
import Joi from 'joi';
import { sendError } from '../utils/response.js';

export const validate = (schema: Joi.ObjectSchema) => {
  return (req: Request, res: Response, next: NextFunction) => {
    const { error, value } = schema.validate(req.body, {
      abortEarly: false,
      stripUnknown: true,
    });

    if (error) {
      const errors = error.details.map((detail) => ({
        field: detail.path.join('.'),
        message: detail.message,
      }));

      return sendError(res, 'Validation error', 422, { errors });
    }

    // Replace request body with validated value
    req.body = value;
    next();
  };
};