import type { NextApiRequest, NextApiResponse } from 'next';
import { supabaseAdmin } from '../../supabaseAdmin';
import { AuthenticatedUser } from '../authMiddleware';

export const referralsController = {
  async getStats(req: NextApiRequest, res: NextApiResponse, user: AuthenticatedUser) {
    try {
      const referralCode = user.referral_code || 'YHTHD77A';

      let refCount = 0;
      let referredUsers: any[] = [];

      try {
        const { data, count } = await supabaseAdmin
          .from('users')
          .select('id, first_name, last_name, created_at, status', { count: 'exact' })
          .eq('referred_by', user.id);

        if (data) {
          referredUsers = data;
          refCount = count || data.length;
        }
      } catch (e) {
        // fallback
      }

      const earnings = refCount * 100;

      return res.status(200).json({
        success: true,
        data: {
          referral_code: referralCode,
          referral_count: refCount,
          total_earnings: earnings,
          referrals: referredUsers.map((u: any) => ({
            first_name: u.first_name,
            last_name: u.last_name,
            created_at: u.created_at,
            status: u.status || 'active',
          })),
        },
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },

  async getSettings(req: NextApiRequest, res: NextApiResponse) {
    try {
      let bonus = 100;
      try {
        const { data } = await supabaseAdmin
          .from('referral_settings')
          .select('*')
          .maybeSingle();
        if (data?.bonus_amount) bonus = Number(data.bonus_amount);
      } catch (e) {
        // fallback
      }

      return res.status(200).json({
        success: true,
        data: {
          referrer_bonus_amount: bonus,
          referee_bonus_amount: 50,
          min_transaction_for_bonus: 500,
          is_active: true,
        },
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },
};
