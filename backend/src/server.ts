import dotenv from "dotenv";
import { config } from './config/env.js';

// Add error handlers
process.on('uncaughtException', (error) => {
  console.error('❌ Uncaught Exception:', error);
  process.exit(1);
});

process.on('unhandledRejection', (reason, promise) => {
  console.error('❌ Unhandled Rejection at:', promise, 'reason:', reason);
  process.exit(1);
});

dotenv.config();

async function startServer() {
  try {
    console.log('🔍 Loading app module...');
    const { default: app } = await import("./app.js");
    const { connectDB } = await import("./config/db.js");
    
    const PORT = config.port || 5000;
    console.log(`🔌 Attempting to connect to MongoDB at: ${config.mongoUri}`);

    try {
      await connectDB();
      console.log('✅ MongoDB connected successfully');
    } catch (dbError) {
      console.error('❌ MongoDB connection error:', dbError);
      throw dbError; // Re-throw to be caught by the outer catch
    }
    
    const server = app.listen(PORT, () => {
      console.log(`✅ Server running on http://localhost:${PORT}`);
      console.log(`🔧 Environment: ${config.nodeEnv}`);
    });

    // Handle server errors
    server.on('error', (error: NodeJS.ErrnoException) => {
      if (error.syscall !== 'listen') throw error;
      
      // Handle specific listen errors with friendly messages
      switch (error.code) {
        case 'EACCES':
          console.error(`Port ${PORT} requires elevated privileges`);
          process.exit(1);
          break;
        case 'EADDRINUSE':
          console.error(`Port ${PORT} is already in use`);
          process.exit(1);
          break;
        default:
          throw error;
      }
    });
  } catch (error: any) {
    console.error("❌ Server startup failed:", error.message);
    console.error("Error details:", error);
    if (error.code) console.error("Error code:", error.code);
    if (error.stack) console.error("Stack:", error.stack);
    process.exit(1);
  }
}

startServer();
