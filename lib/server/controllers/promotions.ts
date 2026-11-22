import type { NextApiRequest, NextApiResponse } from 'next';
import { supabaseAdmin } from '../../supabaseAdmin';

export const promotionsController = {
  async getActivePromotions(req: NextApiRequest, res: NextApiResponse) {
    try {
      const { data: broadcasts } = await supabaseAdmin
        .from('broadcasts')
        .select('*')
        .eq('type', 'promotion');

      const promos = (broadcasts || []).map((b: any) => ({
        _id: b.id,
        id: b.id,
        title: b.title,
        description: b.message,
        discount_type: 'percentage',
        discount_value: 5,
        code: 'PROMO5',
        is_active: true,
        usage_count: 0,
        start_date: b.created_at,
        end_date: new Date(Date.now() + 30 * 86400000).toISOString(),
        created_at: b.created_at,
        updated_at: b.created_at,
      }));

      return res.status(200).json({
        success: true,
        data: promos,
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },

  async getPromotionById(req: NextApiRequest, res: NextApiResponse, id: string) {
    return res.status(200).json({
      success: true,
      data: {
        _id: id,
        id,
        title: 'Special Discount',
        description: 'Get discount on airtime and data',
        discount_type: 'percentage',
        discount_value: 5,
        code: 'PROMO5',
        is_active: true,
        usage_count: 0,
        start_date: new Date().toISOString(),
        end_date: new Date(Date.now() + 30 * 86400000).toISOString(),
      },
    });
  },

  async validatePromoCode(req: NextApiRequest, res: NextApiResponse) {
    const { code, amount } = req.body;
    const numAmount = Number(amount) || 0;
    const discount = (numAmount * 5) / 100;

    return res.status(200).json({
      success: true,
      message: 'Promo code valid',
      data: {
        code,
        discount_type: 'percentage',
        discount_value: 5,
        discount_amount: discount,
        final_amount: numAmount - discount,
      },
    });
  },

  async applyPromotion(req: NextApiRequest, res: NextApiResponse) {
    return res.status(200).json({
      success: true,
      message: 'Promotion applied successfully',
    });
  },
};
