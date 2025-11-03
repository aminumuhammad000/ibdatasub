// controllers/support.controller.ts
import { Response } from 'express';
import { SupportTicket } from '../models';
import { ApiResponse } from '../utils/response';
import { AuthRequest } from '../types';

export class SupportController {
  static async createTicket(req: AuthRequest, res: Response) {
    try {
      const { subject, description, priority } = req.body;

      const ticket = await SupportTicket.create({
        user_id: req.user?.id,
        subject,
        description,
        priority: priority || 'medium',
        status: 'new'
      });

      return ApiResponse.success(res, ticket, 'Support ticket created successfully', 201);
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async getTickets(req: AuthRequest, res: Response) {
    try {
      const tickets = await SupportTicket.find({ user_id: req.user?.id })
        .sort({ created_at: -1 });

      return ApiResponse.success(res, tickets, 'Tickets retrieved successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async getAllTickets(req: AuthRequest, res: Response) {
    try {
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 10;
      const skip = (page - 1) * limit;

      const filter: any = {};
      if (req.query.status) filter.status = req.query.status;
      if (req.query.priority) filter.priority = req.query.priority;

      const tickets = await SupportTicket.find(filter)
        .populate('user_id', 'first_name last_name email')
        .populate('admin_id', 'first_name last_name')
        .skip(skip)
        .limit(limit)
        .sort({ created_at: -1 });

      const total = await SupportTicket.countDocuments(filter);

      return ApiResponse.paginated(res, tickets, {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit)
      }, 'Tickets retrieved successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }

  static async updateTicketStatus(req: AuthRequest, res: Response) {
    try {
      const { status, admin_id } = req.body;

      const ticket = await SupportTicket.findByIdAndUpdate(
        req.params.id,
        { status, admin_id, updated_at: new Date() },
        { new: true }
      );

      if (!ticket) {
        return ApiResponse.error(res, 'Ticket not found', 404);
      }

      return ApiResponse.success(res, ticket, 'Ticket updated successfully');
    } catch (error: any) {
      return ApiResponse.error(res, error.message, 500);
    }
  }
}