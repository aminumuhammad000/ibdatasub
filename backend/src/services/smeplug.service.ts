import axios, { AxiosInstance } from 'axios';
import ProviderConfig from '../models/provider.model.js';
import logger from '../utils/logger.js';

class SMEPlugService {
  private api: AxiosInstance | null = null;
  private async ensureClient() {
    if (this.api) return this.api;
    const cfg = await ProviderConfig.findOne({ code: 'smeplug' });
    const baseURL = cfg?.base_url || 'https://smeplug.ng/api';
    const apiKey = (cfg?.metadata as any)?.env?.SMEPLUG_API_KEY || cfg?.api_key || '';
    this.api = axios.create({
      baseURL,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${apiKey}`,
      },
      timeout: 30000,
    });
    return this.api;
  }

  async getNetworks() {
    const api = await this.ensureClient();
    // Placeholder endpoint (adjust to SME Plug's docs if different)
    const res = await api.get('/v1/networks');
    return res.data;
  }

  async getDataPlans() {
    const api = await this.ensureClient();
    const res = await api.get('/v1/dataplans');
    return res.data;
  }

  async purchaseAirtime(data: any) {
    const api = await this.ensureClient();
    const res = await api.post('/v1/airtime', data);
    return res.data;
  }

  async purchaseData(data: any) {
    const api = await this.ensureClient();
    const res = await api.post('/v1/data', data);
    return res.data;
  }

  async getTransactionStatus(reference: string) {
    const api = await this.ensureClient();
    const res = await api.get(`/v1/transactions/${encodeURIComponent(reference)}`);
    return res.data;
  }
}

export default new SMEPlugService();
