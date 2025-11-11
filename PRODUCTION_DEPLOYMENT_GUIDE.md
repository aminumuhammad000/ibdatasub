# Production Deployment Guide

## Overview

This guide explains how to deploy the VTU App to production with automated admin initialization.

## Pre-Deployment Checklist

- [ ] Node.js 16+ installed
- [ ] MongoDB 4.4+ running and accessible
- [ ] Environment variables configured (.env file)
- [ ] All tests passing
- [ ] Build succeeds without errors

## Environment Setup

### 1. Create `.env` file in backend directory

```bash
cd backend
cp .env.example .env
```

**Required Environment Variables:**

```env
# Database
MONGODB_URI=mongodb://username:password@host:port/database_name

# JWT
JWT_SECRET=your-super-secret-key-change-this
JWT_EXPIRY=7d

# App
NODE_ENV=production
PORT=5000
APP_URL=https://your-production-domain.com

# Optional
LOG_LEVEL=info
CORS_ORIGIN=https://your-frontend-domain.com
```

### 2. Create `.env` file in admin (frontend) directory

```bash
cd admin
cp .env.example .env
```

**Required Environment Variables:**

```env
VITE_API_BASE_URL=https://your-api-domain.com/api/admin
VITE_APP_NAME=VTU Admin Panel
```

## Installation & Setup

### Step 1: Clone & Install Dependencies

```bash
# Install backend dependencies
cd backend
npm install

# Install frontend dependencies
cd ../admin
npm install
```

### Step 2: Initialize Admin User (Automated)

This is the key step - it will check if an admin exists and create one if needed:

```bash
cd backend
npm run init:admin
```

**What this script does:**
1. Connects to MongoDB
2. Checks if a Super Admin role exists (creates if needed)
3. Checks if an active admin user exists
4. If no admin exists, creates one with:
   - Email: `admin@vtuapp.com`
   - Password: Secure random 12-character password
5. Displays credentials in a secure format (SAVE THESE!)
6. Provides next steps

**Output Example:**

```
╔════════════════════════════════════════════════════════════╗
║        VTU APP - ADMIN INITIALIZATION SCRIPT               ║
║              Production Ready Setup                        ║
╚════════════════════════════════════════════════════════════╝

📡 Step 1: Connecting to MongoDB...
   ✅ Connected successfully

📡 Step 2: Checking admin role...
   ✅ Super Admin role already exists

📡 Step 3: Checking for existing admin user...
   ⚠️  No active admin user found

📡 Step 4: Creating new admin user with secure password...
   ✅ NEW ADMIN USER CREATED SUCCESSFULLY!

╔════════════════════════════════════════════════════════════╗
║         🔐 ADMIN CREDENTIALS - SAVE SECURELY! 🔐          ║
╠════════════════════════════════════════════════════════════╣
║ 📧 EMAIL:                admin@vtuapp.com                  ║
║ 🔑 PASSWORD:             aB#3mK$9xL2wQ7                   ║
╠════════════════════════════════════════════════════════════╣
║ 👤 NAME:                 Super Admin                       ║
║ 🛡️  ROLE:                 Super Admin                       ║
║ ✅ STATUS:                Active                            ║
╚════════════════════════════════════════════════════════════╝

⚠️  IMPORTANT SECURITY NOTES:
   1. Save these credentials in a SECURE location (password manager)
   2. Change the password after your first login
   3. Do NOT commit these credentials to version control
   4. Do NOT share these credentials publicly
```

## Deployment Steps

### Option A: Docker Deployment

1. **Build Docker Image:**

```bash
docker build -t vtu-app-backend:latest .
docker build -t vtu-app-admin:latest ./admin
```

2. **Run Containers:**

```bash
# Backend
docker run -d \
  -e MONGODB_URI=your_mongo_uri \
  -e JWT_SECRET=your_secret \
  -p 5000:5000 \
  --name vtu-backend \
  vtu-app-backend:latest

# Frontend
docker run -d \
  -e VITE_API_BASE_URL=https://your-api.com \
  -p 3000:5173 \
  --name vtu-admin \
  vtu-app-admin:latest
```

3. **Initialize Admin:**

```bash
docker exec vtu-backend npm run init:admin
```

### Option B: Traditional Server Deployment

1. **Clone Repository:**

```bash
git clone <repo-url>
cd VTUApp
```

2. **Install & Build Backend:**

```bash
cd backend
npm install
npm run build
```

3. **Install & Build Frontend:**

```bash
cd ../admin
npm install
npm run build
```

4. **Initialize Admin User:**

```bash
cd ../backend
npm run init:admin
```

5. **Start Services:**

```bash
# In terminal 1 - Backend
cd backend
npm start

# In terminal 2 - Frontend (using PM2)
cd admin
pm2 start "npm run preview" --name "vtu-admin"
```

## Verification

After deployment, verify everything is working:

### 1. Check Backend Health

```bash
curl https://your-api-domain.com/api/admin/login -X OPTIONS
```

Expected: HTTP 200 (CORS preflight response)

### 2. Login Test

Navigate to `https://your-app-domain.com/login` and login with:
- Email: `admin@vtuapp.com`
- Password: (the one generated by init:admin script)

### 3. Check Logs

```bash
# Backend logs
tail -f backend/logs/combined.log

# Frontend logs (if using PM2)
pm2 logs vtu-admin
```

## Admin User Management

### Reset Admin Password

If you forget the admin password:

```bash
cd backend
npm run init:admin
```

This will show you the existing admin or create a new one.

### Create Additional Admins

Once logged in as admin, use the admin panel to create additional admin accounts.

### Delete Admin User

To delete the default admin and create a fresh one:

```bash
# From MongoDB shell
db.adminusers.deleteOne({ email: "admin@vtuapp.com" })

# Then run
npm run init:admin
```

## Security Best Practices

1. **Change Default Password**: After first login, immediately change the admin password
2. **Use Strong Passwords**: Enforce strong password policies in production
3. **Enable HTTPS**: Always use HTTPS in production
4. **Firewall**: Restrict MongoDB access to application servers only
5. **Backups**: Daily automated database backups
6. **Monitoring**: Set up error tracking and performance monitoring
7. **Rate Limiting**: Already enabled on API endpoints
8. **JWT Secret**: Use a cryptographically secure random string (min 32 chars)

### Generate Secure JWT Secret

```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

## Troubleshooting

### MongoDB Connection Failed

```
Error: Please check your firewall rules and network connection
```

**Solutions:**
1. Verify MongoDB is running
2. Check connection string in .env
3. Verify firewall allows connections
4. Check MongoDB authentication (username/password)

### Admin Creation Failed

```
Error: Admin user creation failed
```

**Solutions:**
1. Ensure MongoDB is connected first
2. Check MongoDB user has write permissions
3. Try deleting existing admin: `db.adminusers.deleteOne({ email: "admin@vtuapp.com" })`
4. Run init:admin again

### CORS Issues

```
Access to XMLHttpRequest blocked by CORS policy
```

**Solution:** Update CORS_ORIGIN in backend .env:

```env
CORS_ORIGIN=https://your-frontend-domain.com
```

## Scaling Considerations

1. **Load Balancing**: Use nginx or HAProxy to balance requests
2. **Database Replication**: Set up MongoDB replica sets
3. **Caching**: Implement Redis for session/query caching
4. **CDN**: Use CDN for static frontend assets
5. **Monitoring**: Set up CloudWatch/Datadog for metrics

## Post-Deployment

1. ✅ Login and verify admin panel works
2. ✅ Create test transactions to verify API endpoints
3. ✅ Set up monitoring and alerting
4. ✅ Configure automated backups
5. ✅ Create runbook for common issues
6. ✅ Brief support team on admin panel features

## Rollback Plan

If deployment fails:

1. Revert to previous container/build
2. Database remains unchanged (no migrations assumed)
3. Users can continue using the app

## Support

For issues during deployment:
1. Check logs in `backend/logs/` directory
2. Review environment variables configuration
3. Verify all dependencies are installed
4. Check network connectivity and firewall rules

---

**Created**: 2025-11-11
**Version**: 1.0.0
**Status**: Production Ready
