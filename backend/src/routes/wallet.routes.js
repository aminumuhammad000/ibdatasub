import { Router } from 'express';
const router = Router();

router.get('/', (req, res) => {
  res.json({ ok: true, service: 'wallet' });
});

export default router;
