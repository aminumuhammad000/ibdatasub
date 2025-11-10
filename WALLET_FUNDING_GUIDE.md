# Wallet Funding Guide

## Issue: Insufficient Wallet Balance

Your wallet currently has **₦0.98** but you're trying to purchase **₦1000** airtime.

## Solutions:

### Option 1: Use Virtual Account (Recommended for Production)

1. **Transfer money to your virtual account** shown in the app:
   - Account Number: `6657921051`
   - Bank Name: `PALMPAY`
   - Account Name: `Maryam Umar(Payrant)`

2. **The webhook will automatically credit your wallet** when payment is received

### Option 2: Admin Manual Credit (For Testing Only)

Use the admin endpoint to manually credit a wallet:

**Step 1: Login as Admin**
```bash
curl -X POST https://vtuapp-production.up.railway.app/api/admin/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@vtuapp.com",
    "password": "Admin@123456"
  }'
```

**Step 2: Copy the token from response**

**Step 3: Credit the wallet**
```bash
curl -X POST https://vtuapp-production.up.railway.app/api/admin/wallet/credit \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_ADMIN_TOKEN_HERE" \
  -d '{
    "userId": "6911dd9befeab41fdcf20564",
    "amount": 5000,
    "description": "Test funding"
  }'
```

**Response:**
```json
{
  "success": true,
  "message": "Wallet credited successfully",
  "data": {
    "wallet": {
      "_id": "6911dd9befeab41fdcf20566",
      "user_id": "6911dd9befeab41fdcf20564",
      "balance": 5000.98,
      "currency": "NGN",
      ...
    }
  }
}
```

### Option 3: Quick Test Script

Create a file `credit-wallet.sh`:

```bash
#!/bin/bash

# Login as admin and get token
ADMIN_TOKEN=$(curl -s -X POST https://vtuapp-production.up.railway.app/api/admin/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@vtuapp.com","password":"Admin@123456"}' | jq -r '.data.token')

echo "Admin Token: $ADMIN_TOKEN"

# Credit wallet
curl -X POST https://vtuapp-production.up.railway.app/api/admin/wallet/credit \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ADMIN_TOKEN" \
  -d '{
    "userId": "6911dd9befeab41fdcf20564",
    "amount": 5000,
    "description": "Test funding for airtime purchase"
  }'
```

Make it executable and run:
```bash
chmod +x credit-wallet.sh
./credit-wallet.sh
```

## Notes:

- The user ID `6911dd9befeab41fdcf20564` is Maryam Umar's account
- After crediting, try the airtime purchase again from the mobile app
- For production, users should fund via virtual account transfers
- Admin manual credit is logged in audit logs for tracking

## Verify Wallet Balance:

Check the wallet balance in the mobile app or via API:
```bash
curl -X GET https://vtuapp-production.up.railway.app/api/wallet \
  -H "Authorization: Bearer USER_TOKEN_HERE"
```
