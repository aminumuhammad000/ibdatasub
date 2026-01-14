import { NextFunction, Response } from 'express';
import { User } from '../models/user.model.js';
import { AuthRequest } from '../types/index.js';

export const apiKeyMiddleware = async (req: AuthRequest, res: Response, next: NextFunction) => {
    const apiKey = req.headers['x-api-key'] as string;

    if (!apiKey) {
        return next(); // Continue to check for JWT if no API key is provided
    }

    try {
        const user = await User.findOne({ api_key: apiKey, api_key_enabled: true });

        if (!user) {
            return res.status(401).json({
                success: false,
                message: 'Invalid or disabled API key',
            });
        }

        // Attach user info to request object
        req.user = {
            id: user._id.toString(),
            // You can add more fields if needed, like role
        };

        next();
    } catch (error) {
        console.error('API Key validation error:', error);
        res.status(500).json({
            success: false,
            message: 'Internal server error during API key validation',
        });
    }
};
