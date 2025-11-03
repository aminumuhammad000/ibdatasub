// utils/response.ts
import { Response } from 'express';

export class ApiResponse {
  static success(res: Response, data: any, message = 'Success', statusCode = 200) {
    return res.status(statusCode).json({
      success: true,
      message,
      data
    });
  }

  static error(res: Response, message = 'Error', statusCode = 500, errors?: any) {
    return res.status(statusCode).json({
      success: false,
      message,
      errors
    });
  }

  static paginated(res: Response, data: any[], pagination: any, message = 'Success') {
    return res.status(200).json({
      success: true,
      message,
      data,
      pagination
    });
  }
}