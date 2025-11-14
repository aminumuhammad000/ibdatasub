import dotenv from 'dotenv';
import mongoose from 'mongoose';
import ProviderConfig from '../models/provider.model.js';
import logger from '../utils/logger.js';
import { config } from '../config/bootstrap.js';

dotenv.config();

const PROVIDERS = [
  {
    name: 'Topupmate',
    code: 'topupmate',
    base_url: 'https://connect.topupmate.com/api',
    api_key: process.env.TOPUPMATE_API_KEY || '',
    secret_key: '',
    username: '',
    password: '',
    active: true,
    priority: 1,
    supported_services: ['airtime','data','cable','electricity','exampin'],
    metadata: {
      env: {
        TOPUPMATE_API_KEY: process.env.TOPUPMATE_API_KEY || ''
      }
    }
  },
  {
    name: 'VTpass',
    code: 'vtpass',
    base_url: 'https://api-service.vtpass.com/api',
    api_key: process.env.VTPASS_API_KEY || '',
    secret_key: process.env.VTPASS_SECRET || '',
    username: process.env.VTPASS_USERNAME || '',
    password: process.env.VTPASS_PASSWORD || '',
    active: false,
    priority: 2,
    supported_services: ['airtime','data','cable','electricity'],
    metadata: {
      env: {
        VTPASS_API_KEY: process.env.VTPASS_API_KEY || '',
        VTPASS_SECRET: process.env.VTPASS_SECRET || '',
        VTPASS_USERNAME: process.env.VTPASS_USERNAME || '',
        VTPASS_PASSWORD: process.env.VTPASS_PASSWORD || ''
      }
    }
  },
  {
    name: 'SME Plug',
    code: 'smeplug',
    base_url: 'https://smeplug.ng/api',
    api_key: process.env.SMEPLUG_API_KEY || '',
    secret_key: '',
    username: '',
    password: '',
    active: false,
    priority: 3,
    supported_services: ['airtime','data'],
    metadata: {
      env: {
        SMEPLUG_API_KEY: process.env.SMEPLUG_API_KEY || ''
      }
    }
  }
];

async function run() {
  try {
    const mongoUrl = config.mongoUri;
    await mongoose.connect(mongoUrl);
    logger.info('Connected to MongoDB');

    for (const p of PROVIDERS) {
      const exists = await ProviderConfig.findOne({ code: p.code });
      if (exists) {
        await ProviderConfig.updateOne({ _id: exists._id }, { $set: p });
        logger.info(`Updated provider: ${p.code}`);
      } else {
        await ProviderConfig.create(p as any);
        logger.info(`Inserted provider: ${p.code}`);
      }
    }

    console.log(`✅ Providers seeded/updated: ${PROVIDERS.length}`);
  } catch (err) {
    logger.error('Error seeding providers:', err);
    console.error('❌ Error seeding providers:', err);
    process.exit(1);
  } finally {
    await mongoose.disconnect();
    logger.info('Disconnected from MongoDB');
  }
}

run();
