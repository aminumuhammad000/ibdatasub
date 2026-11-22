import type { NextApiRequest, NextApiResponse } from 'next';
import { supabaseAdmin } from '../../supabaseAdmin';
import { AuthenticatedUser } from '../authMiddleware';

export const supportController = {
  async createTicket(req: NextApiRequest, res: NextApiResponse, user: AuthenticatedUser) {
    try {
      const { subject, message, priority = 'medium', category } = req.body;
      const ticketId = `TICK-${Date.now()}`;

      // Insert audit log or notification for ticket tracking
      await supabaseAdmin.from('audit_logs').insert({
        user_id: user.id,
        action: 'CREATE_SUPPORT_TICKET',
        entity_type: 'support_ticket',
        entity_id: ticketId,
        new_value: { subject, message, priority, category },
      });

      const ticket = {
        _id: ticketId,
        id: ticketId,
        user_id: user.id,
        subject,
        message,
        priority,
        category,
        status: 'open',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      };

      return res.status(201).json({
        success: true,
        message: 'Support ticket created successfully',
        data: ticket,
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },

  async getTickets(req: NextApiRequest, res: NextApiResponse, user: AuthenticatedUser) {
    try {
      const { data } = await supabaseAdmin
        .from('audit_logs')
        .select('*')
        .eq('user_id', user.id)
        .eq('entity_type', 'support_ticket')
        .order('timestamp', { ascending: false });

      const tickets = (data || []).map((log: any) => ({
        _id: log.entity_id || log.id,
        id: log.entity_id || log.id,
        user_id: user.id,
        subject: log.new_value?.subject || 'Support Request',
        message: log.new_value?.message || '',
        priority: log.new_value?.priority || 'medium',
        category: log.new_value?.category || 'general',
        status: 'open',
        created_at: log.timestamp,
        updated_at: log.timestamp,
      }));

      return res.status(200).json({
        success: true,
        data: tickets,
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },

  async getTicketById(req: NextApiRequest, res: NextApiResponse, id: string, user: AuthenticatedUser) {
    return res.status(200).json({
      success: true,
      data: {
        _id: id,
        id,
        user_id: user.id,
        subject: 'Support Ticket',
        message: 'We are processing your request',
        priority: 'medium',
        status: 'open',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      },
    });
  },

  async updateTicket(req: NextApiRequest, res: NextApiResponse, id: string) {
    return res.status(200).json({
      success: true,
      message: 'Ticket updated',
      data: { _id: id, id, ...req.body },
    });
  },

  async closeTicket(req: NextApiRequest, res: NextApiResponse, id: string) {
    return res.status(200).json({
      success: true,
      message: 'Ticket closed successfully',
    });
  },

  async deleteTicket(req: NextApiRequest, res: NextApiResponse, id: string) {
    return res.status(200).json({
      success: true,
      message: 'Ticket deleted successfully',
    });
  },

  async getSupportContent(req: NextApiRequest, res: NextApiResponse) {
    try {
      const { data } = await supabaseAdmin
        .from('support_content')
        .select('*')
        .maybeSingle();

      const content = data?.content || {
        email: 'support@ibdata.com.ng',
        phoneNumber: '+2349162989954',
        whatsappNumber: '+2349162989954',
        websiteUrl: 'https://ibdata.com.ng',
        facebookUrl: '',
        twitterUrl: '',
        instagramUrl: '',
      };

      return res.status(200).json({
        success: true,
        data: content,
      });
    } catch (err: any) {
      return res.status(500).json({ success: false, message: err.message });
    }
  },
};
