import express, { Request, Response, NextFunction } from "express";
import cors from "cors";
import dotenv from "dotenv";

import authRoutes from "./routes/auth.routes.js";
import usersRoutes from "./routes/users.routes.js";
import transactionsRoutes from "./routes/transactions.routes.js";
import adminRoutes from "./routes/admin.routes.js";
import notificationsRoutes from "./routes/notifications.routes.js";
import promotionsRoutes from "./routes/promotions.routes.js";
import supportRoutes from "./routes/support.routes.js";
import walletRoutes from "./routes/wallet.routes.js";
import paymentRoutes from "./routes/payment.routes.js";
// import billpaymentRoutes from "./routes/billpayment.routes.js";

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

// Routes
app.use("/api/auth", authRoutes);
app.use("/api/users", usersRoutes);
app.use("/api/transactions", transactionsRoutes);
app.use("/api/admin", adminRoutes);
app.use("/api/notifications", notificationsRoutes);
app.use("/api/promotions", promotionsRoutes);
app.use("/api/support", supportRoutes);
app.use("/api/wallet", walletRoutes);
app.use("/api/payment", paymentRoutes);
// app.use("/api/billpayment", billpaymentRoutes);

// Root route
app.get("/", (req: Request, res: Response) => {
  res.send("✅ Connecta Backend (MongoDB) is running...");
});

// Health check
app.get("/health", (req: Request, res: Response) => {
  res.status(200).json({ status: "ok", message: "Server is running" });
});

// Test TopUpMate service
app.get("/api/test-topupmate", async (req: Request, res: Response) => {
  try {
    const { default: topupmateService } = await import("./services/topupmate.service.js");
    const networks = await topupmateService.getNetworks();
    res.json({ success: true, message: "TopUpMate service is working!", data: networks });
  } catch (error: any) {
    res.status(500).json({ success: false, message: "TopUpMate service error", error: error.message });
  }
});

// Global error handler
app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error("❌ Error:", err.stack);
  res.status(500).json({ message: "Internal Server Error", error: err.message });
});

export default app;
