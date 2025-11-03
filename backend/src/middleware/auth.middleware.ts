// middleware/auth.middleware.ts
import { Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import { config } from '../config/env';
import { ApiResponse } from '../utils/response';
import { AuthRequest } from '../types';

export const authMiddleware = (req: AuthRequest, res: Response, next: NextFunction) => {
  try {
    const token = req.headers.authorization?.split(' ')[1];
    
    if (!token) {
      return ApiResponse.error(res, 'No token provided', 401);
    }

    const decoded = jwt.verify(token, config.jwtSecret) as { id: string; role?: string };
    req.user = decoded;
    next();
  } catch (error) {
    return ApiResponse.error(res, 'Invalid token', 401);
  }
};