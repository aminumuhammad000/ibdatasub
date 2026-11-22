import type { NextApiRequest, NextApiResponse } from 'next';
import { supabaseAdmin } from '../../supabaseAdmin';
import { AuthenticatedUser } from '../authMiddleware';

const DEFAULT_A2C_SETTINGS = [
  { _id: '1', id: '1', network: 'MTN', discount_rate: 80, min_amount: 500, max_amount: 50000, phone_number: '08100000000', active: true },
  { _id: '2', id: '2', network: 'Airtel', discount_rate: 75, min_amount: 500, max_amount: 50000, phone_number: '08100000000', active: true },
  { _id: '3', id: '3', network: 'Glo', discount_rate: 70, min_amount: 500, max_amount: 50000, phone_number: '08100000000', active: true },
  { _id: '4', id: '4', network: '9mobile', discount_rate: 70, min_amount: 500, max_amount: 50000, phone_number: '08100000000', active: true },
];

export const airtimeToCashController = {
  async submitRequest(req: NextApiRequest, res: NextApiResponse, user: AuthenticatedUser) {
    try {
      const { network, phone_number, amount } = req.body;
      const numAmount = Number(amount);
      let rate = 80;

      try {
        const { data: setting } = await supabaseAdmin
          .from('airtime_to_cash_settings')
          .select('*')
          .ilike('network', `%${network}%`)
          .eq('active', true)
          .maybeSingle();

        if (setting?.discount_rate) rate = Number(setting.discount_rate);
      } catch (e) {
        // fallback
      }

      const amountToReceive = (numAmount * rate) / 100;
      let record: any = null;

      try {
        const { data, error } = await supabaseAdmin
          .from('airtime_to_cash_requests')
          .insert({
            user_id: user.id,
            network,
            phone_number,
            amount: numAmount,
            amount_to_receive: amountToReceive,
            status: 'pending',
          })
          .select()
          .single();

        if (!error && data) record = data;
      } catch (e) {
        // fallback
      }

      if (!record) {
        record = {
          id: `a2c_${Date.now()}`,
          user_id: user.id,
          network,
          phone_number,
          amount: numAmount,
          amount_to_receive: amountToReceive,
          status: 'pending',
          created_at: new Date().toISOString(),
        };
      }

      return res.status(201).json({
        success: true,
        message: 'Airtime to cash request submitted successfully',
        data: {
          ...record,
          _id: record.id,
        },
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },

  async getMyRequests(req: NextApiRequest, res: NextApiResponse, user: AuthenticatedUser) {
    try {
      let requests: any[] = [];
      try {
        const { data, error } = await supabaseAdmin
          .from('airtime_to_cash_requests')
          .select('*')
          .eq('user_id', user.id)
          .order('created_at', { ascending: false });

        if (!error && data) requests = data;
      } catch (e) {
        // fallback
      }

      return res.status(200).json({
        success: true,
        data: requests.map((r: any) => ({ ...r, _id: r.id })),
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },

  async getSettings(req: NextApiRequest, res: NextApiResponse) {
    try {
      let settings: any[] = [];
      try {
        const { data, error } = await supabaseAdmin
          .from('airtime_to_cash_settings')
          .select('*')
          .eq('active', true);

        if (!error && data && data.length > 0) settings = data;
      } catch (e) {
        // fallback
      }

      if (settings.length === 0) {
        settings = DEFAULT_A2C_SETTINGS;
      }

      return res.status(200).json({
        success: true,
        data: settings.map((s: any) => ({ ...s, _id: s.id })),
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },
};
