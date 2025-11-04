// config/db.ts
import mongoose from 'mongoose';
import { config } from './env.js';
import { logger } from './logger.js';

export const connectDB = async (): Promise<void> => {
  try {
    await mongoose.connect(config.mongoUri);
    logger.info('MongoDB connected successfully');
  } catch (error) {
    logger.error('MongoDB connection error:', error);
    process.exit(1);
  }
};
