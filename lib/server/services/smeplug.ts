import axios, { AxiosInstance } from 'axios';
import { supabaseAdmin } from '../../supabaseAdmin';

class SMEPlugService {
  private api: AxiosInstance | null = null;
  private apiKey: string = '';
  private baseUrl: string = 'https://smeplug.ng/api';

  private getNetworkId(network: string | number): number {
    const net = String(network).toLowerCase();

    // Map: 1=MTN, 2=Airtel, 3=Glo, 4=9mobile
    // SMEPlug IDs: 1=MTN, 2=Airtel, 3=9mobile, 4=Glo
    if (net === '1' || net === 'mtn') return 1;
    if (net === '2' || net === 'airtel') return 2;
    if (net === '3' || net === 'glo' || net === 'globacom') return 4;
    if (net === '4' || net === '9mobile' || net === 'etisalat') return 3;

    return 1;
  }

  private async getClient(): Promise<AxiosInstance> {
    if (this.api && this.apiKey) return this.api;

    let apiKey = process.env.SMEPLUG_API_KEY || '';
    let baseUrl = process.env.SMEPLUG_BASE_URL || 'https://smeplug.ng/api';

    try {
      const { data: provider } = await supabaseAdmin
        .from('providers')
        .select('*')
        .eq('code', 'smeplug')
        .maybeSingle();

      if (provider) {
        if (provider.base_url) baseUrl = provider.base_url;
        if (provider.api_key) apiKey = provider.api_key;
        if (!apiKey && provider.metadata?.env?.SMEPLUG_API_KEY) {
          apiKey = provider.metadata.env.SMEPLUG_API_KEY;
        }
        if (!apiKey && provider.metadata?.env?.NEW_KEY) {
          apiKey = provider.metadata.env.NEW_KEY;
        }
      }
    } catch (e) {
      console.warn('Could not load SMEPlug provider from db:', e);
    }

    if (!apiKey) {
      apiKey = 'a603f3e3b80a88826060f364719646c06efc2a0105eaf688fd032b8e6ac42aec';
    }

    this.apiKey = apiKey;
    this.baseUrl = baseUrl;
    this.api = axios.create({
      baseURL: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        Authorization: `Bearer ${apiKey}`,
      },
      timeout: 30000,
    });

    return this.api;
  }

  async getBalance() {
    const client = await this.getClient();
    const res = await client.get('/v1/account/balance');
    return res.data;
  }

  async getNetworks() {
    const client = await this.getClient();
    const res = await client.get('/v1/networks');
    return res.data;
  }

  async getDataPlans() {
    const client = await this.getClient();
    const res = await client.get('/v1/data/plans');
    return res.data;
  }

  async purchaseAirtime(data: { network: string | number; phone: string; amount: number; ref: string }) {
    const client = await this.getClient();
    const payload = {
      network_id: this.getNetworkId(data.network),
      amount: Number(data.amount),
      phone: data.phone,
      customer_reference: data.ref,
    };
    const res = await client.post('/v1/airtime/purchase', payload);
    return res.data;
  }

  async purchaseData(data: { network: string | number; plan_id: string | number; phone: string; ref: string }) {
    const client = await this.getClient();
    const payload = {
      network_id: this.getNetworkId(data.network),
      plan_id: Number(data.plan_id),
      phone: data.phone,
      customer_reference: data.ref,
    };
    const res = await client.post('/v1/data/purchase', payload);
    return res.data;
  }
}

export const smeplugService = new SMEPlugService();
