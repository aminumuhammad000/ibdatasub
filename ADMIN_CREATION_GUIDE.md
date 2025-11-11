# 🚀 Admin Creation Guide

This guide shows you how to create admin users in **3 different ways**:

## Method 1: Frontend Admin Panel (Easiest) ✨

### Steps:
1. **Navigate to Admin Management Page**
   - Go to `http://localhost:5174/admins` (local)
   - Or `https://vtuapp-production.up.railway.app/admins` (production)

2. **Click "Create Admin" Button**
   - Fill in first name, last name, and email
   - Click "Generate" to auto-generate a secure password
   - Or enter your own password

3. **Submit the Form**
   - Click "Create" button
   - System displays the credentials
   - Save credentials securely (password manager recommended)

4. **Share with New Admin**
   - Send email and password securely
   - They can login and change password on first access

---

## Method 2: Command Line (Local Development) 🖥️

### Initialize Admin with Script:
```bash
cd /home/amee/Desktop/VTUApp/backend
npm run init:admin
```

**Output Example:**
```
╔════════════════════════════════════════════════════════════╗
║        VTU APP - ADMIN INITIALIZATION SCRIPT                 ║
║              Production Ready Setup                          ║
╚════════════════════════════════════════════════════════════╝

📡 Step 1: Connecting to MongoDB...
   ✅ Connected successfully

📡 Step 2: Checking admin role...
   ✅ Super Admin role already exists

📡 Step 3: Checking for existing admin user...
   ⚠️  Active admin user already exists

   EXISTING ADMIN DETAILS:
   📧 Email: admin@vtuapp.com
   👤 Name: Admin User
   ⏰ Created: 11/11/2025
   🔄 Last Login: 11/11/2025
```

---

## Method 3: cURL API Request (Production) 🌐

### Step 1: Get Admin Token (Login)
```bash
curl -X POST https://vtuapp-production.up.railway.app/api/admin/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@vtuapp.com",
    "password": "YOUR_ADMIN_PASSWORD"
  }'
```

**Response:**
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIs...",
    "admin": {
      "_id": "...",
      "email": "admin@vtuapp.com",
      "first_name": "Admin",
      "last_name": "User"
    }
  }
}
```

### Step 2: Create New Admin User
```bash
curl -X POST https://vtuapp-production.up.railway.app/api/admin/admins \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN_HERE" \
  -d '{
    "email": "newadmin@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "password": "SecurePassword123!"
  }'
```

**Replace `YOUR_TOKEN_HERE` with the token from Step 1.**

**Response:**
```json
{
  "success": true,
  "message": "Admin user created successfully",
  "data": {
    "_id": "507f1f77bcf86cd799439011",
    "email": "newadmin@example.com",
    "first_name": "John",
    "last_name": "Doe",
    "password": "SecurePassword123!",
    "status": "active"
  }
}
```

### Step 3: Get All Admins
```bash
curl -X GET https://vtuapp-production.up.railway.app/api/admin/admins \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

---

## Complete Bash Script (Automated)

Save this as `create-admin.sh`:

```bash
#!/bin/bash

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

API_URL="https://vtuapp-production.up.railway.app/api/admin"

# Step 1: Get token
echo -e "${BLUE}🔑 Step 1: Logging in...${NC}"
LOGIN_RESPONSE=$(curl -s -X POST "$API_URL/login" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@vtuapp.com",
    "password": "Admin@123456"
  }')

TOKEN=$(echo $LOGIN_RESPONSE | grep -o '"token":"[^"]*' | cut -d'"' -f4)

if [ -z "$TOKEN" ]; then
  echo -e "${RED}❌ Login failed!${NC}"
  echo "Response: $LOGIN_RESPONSE"
  exit 1
fi

echo -e "${GREEN}✅ Login successful!${NC}"
echo -e "${BLUE}Token: $TOKEN${NC}\n"

# Step 2: Create new admin
echo -e "${BLUE}📝 Step 2: Creating new admin user...${NC}"

EMAIL=${1:-"manager@example.com"}
FIRST_NAME=${2:-"Manager"}
LAST_NAME=${3:-"User"}
PASSWORD=${4:-"Manager@123456"}

CREATE_RESPONSE=$(curl -s -X POST "$API_URL/admins" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d "{
    \"email\": \"$EMAIL\",
    \"first_name\": \"$FIRST_NAME\",
    \"last_name\": \"$LAST_NAME\",
    \"password\": \"$PASSWORD\"
  }")

echo $CREATE_RESPONSE | grep -q '"success":true'
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Admin created successfully!${NC}"
  echo -e "${YELLOW}📧 Email: $EMAIL${NC}"
  echo -e "${YELLOW}🔑 Password: $PASSWORD${NC}"
  echo -e "\n${GREEN}Complete Response:${NC}"
  echo $CREATE_RESPONSE | jq '.'
else
  echo -e "${RED}❌ Failed to create admin${NC}"
  echo -e "${RED}Response:${NC}"
  echo $CREATE_RESPONSE | jq '.'
fi

# Step 3: List all admins
echo -e "\n${BLUE}📋 Step 3: Fetching all admins...${NC}"

ADMINS_RESPONSE=$(curl -s -X GET "$API_URL/admins" \
  -H "Authorization: Bearer $TOKEN")

echo $ADMINS_RESPONSE | grep -q '"success":true'
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Admins retrieved${NC}"
  echo $ADMINS_RESPONSE | jq '.data | .[] | {name: (.first_name + " " + .last_name), email: .email, status: .status, created: .created_at}'
else
  echo -e "${RED}❌ Failed to fetch admins${NC}"
  echo $ADMINS_RESPONSE | jq '.'
fi
```

### Run the Script:
```bash
chmod +x create-admin.sh

# Create admin with defaults
./create-admin.sh

# Or with custom values
./create-admin.sh "john@example.com" "John" "Smith" "JohnPass123!"
```

---

## API Endpoints Summary

### Create Admin
- **Method:** `POST`
- **URL:** `/api/admin/admins`
- **Auth:** Required (Bearer token)
- **Body:**
  ```json
  {
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "password": "string"
  }
  ```
- **Response:** 201 Created

### Get All Admins
- **Method:** `GET`
- **URL:** `/api/admin/admins?page=1&limit=10`
- **Auth:** Required (Bearer token)
- **Response:** 200 OK

### Login Admin
- **Method:** `POST`
- **URL:** `/api/admin/login`
- **Auth:** Not required
- **Body:**
  ```json
  {
    "email": "string",
    "password": "string"
  }
  ```
- **Response:** 200 OK

---

## Error Handling

### Common Errors and Solutions:

| Error | Cause | Solution |
|-------|-------|----------|
| `Admin with this email already exists` | Email is duplicate | Use a different email address |
| `Invalid email format` | Email format is wrong | Check email format (e.g., admin@example.com) |
| `Invalid credentials` | Wrong login email/password | Verify admin email and password |
| `Unauthorized` | Missing or invalid token | Get a fresh token from login endpoint |
| `Connection timeout` | Server not responding | Check if production server is running |

---

## Security Best Practices

✅ **DO:**
- Use strong passwords (8+ chars, uppercase, lowercase, numbers, special chars)
- Store credentials in password manager
- Change password after first login
- Use HTTPS for all API requests
- Keep tokens secure and don't share them
- Use separate credentials for each admin

❌ **DON'T:**
- Share credentials via email or chat
- Commit credentials to version control
- Use weak or simple passwords
- Reuse passwords across admins
- Keep tokens visible in logs
- Share tokens publicly

---

## Testing Admin Creation

### Local Development:
```bash
# Test create endpoint
curl -X POST http://localhost:5000/api/admin/admins \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "email": "test@example.com",
    "first_name": "Test",
    "last_name": "User",
    "password": "Test@123456"
  }'
```

### Production:
```bash
# Same as above but use production URL
curl -X POST https://vtuapp-production.up.railway.app/api/admin/admins \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "email": "test@example.com",
    "first_name": "Test",
    "last_name": "User",
    "password": "Test@123456"
  }'
```

---

## Troubleshooting

### Token Expired
```bash
# Get a new token
curl -X POST https://vtuapp-production.up.railway.app/api/admin/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@vtuapp.com","password":"YOUR_PASSWORD"}'
```

### Admin Already Exists
```bash
# Use a different email
curl -X POST https://vtuapp-production.up.railway.app/api/admin/admins \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "email": "uniqueemail@example.com",
    "first_name": "New",
    "last_name": "Admin",
    "password": "SecurePass123!"
  }'
```

### Connection Issues
```bash
# Test API connectivity
curl -s https://vtuapp-production.up.railway.app/api/admin/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test","password":"test"}' | jq .
```

---

## Quick Reference

| Task | Command |
|------|---------|
| Create Admin (Frontend) | Go to `/admins` page |
| Create Admin (CLI) | `npm run init:admin` |
| Create Admin (API) | `curl -X POST /api/admin/admins ...` |
| Get All Admins | `curl -X GET /api/admin/admins ...` |
| Login Admin | `curl -X POST /api/admin/login ...` |

---

**Last Updated:** November 11, 2025  
**Version:** 1.0.0  
**Status:** Production Ready ✅
