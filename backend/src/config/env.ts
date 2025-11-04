// config env.ts
import dotenv from 'dotenv';
dotenv.config();

export const config = {
  port: process.env.PORT || 3000,
  nodeEnv: process.env.NODE_ENV || 'development',
  mongoUri: process.env.MONGO_URI || 'mongodb://localhost:27017/connecta_vtu',
  jwtSecret: process.env.JWT_SECRET || 'your-secret-key',
  jwtExpiry: process.env.JWT_EXPIRY || '24h',
  otpExpiry: parseInt(process.env.OTP_EXPIRY || '300000'), // 5 minutes
  corsOrigin: process.env.CORS_ORIGIN || '*',
  logLevel: process.env.LOG_LEVEL || 'info',
};

// config/env.ts - Add these to your existing environment configuration

export default {
  // ... your existing env variables
  
  // TopupMate API Configuration
  TOPUPMATE_API_KEY: process.env.TOPUPMATE_API_KEY || '',
  TOPUPMATE_BASE_URL: process.env.TOPUPMATE_BASE_URL || 'https://connect.topupmate.com/api',
  
  // Service charge configuration (optional - for markup)
  AIRTIME_SERVICE_CHARGE: parseFloat(process.env.AIRTIME_SERVICE_CHARGE || '0'),
  DATA_SERVICE_CHARGE: parseFloat(process.env.DATA_SERVICE_CHARGE || '0'),
  CABLE_SERVICE_CHARGE: parseFloat(process.env.CABLE_SERVICE_CHARGE || '0'),
  ELECTRICITY_SERVICE_CHARGE: parseFloat(process.env.ELECTRICITY_SERVICE_CHARGE || '0'),
  EXAMPIN_SERVICE_CHARGE: parseFloat(process.env.EXAMPIN_SERVICE_CHARGE || '0'),
};

// .env file additions
/*
# TopupMate API Configuration
TOPUPMATE_API_KEY=your_api_key_here
TOPUPMATE_BASE_URL=https://connect.topupmate.com/api

# Service charges (percentage or flat amount)
AIRTIME_SERVICE_CHARGE=0
DATA_SERVICE_CHARGE=0
CABLE_SERVICE_CHARGE=0
ELECTRICITY_SERVICE_CHARGE=0
EXAMPIN_SERVICE_CHARGE=0
*/