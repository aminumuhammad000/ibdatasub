import express from "express";
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

// Root route
app.get("/", (req, res) => {
  res.send("✅ Connecta Backend (MongoDB) is running...");
});

// Global error handler
app.use((err, req, res, next) => {
  console.error("❌ Error:", err.stack);
  res.status(500).json({ message: "Internal Server Error", error: err.message });
});

export default app;
