import type { NextApiRequest, NextApiResponse } from 'next';
import { handleCors } from '../../lib/server/cors';

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  if (handleCors(req, res)) return;

  res.status(200).json({
    success: true,
    message: 'Marabusdata Next.js VTU API server is online',
    status: 'ok',
    version: '2.0.0',
    timestamp: new Date().toISOString(),
  });
}
