# 🚀 Monnify Payment Integration - Complete Setup Guide

## ✅ Implementation Status: COMPLETE

All Monnify payment integration files have been created and are ready to use. You just need to add your Monnify credentials!

---

## 📋 What Has Been Implemented

### **Backend (Node.js + Express + TypeScript)**

1. **✅ Monnify Service** (`/backend/src/services/monnify.service.ts`)
   - Get access token with automatic caching
   - Initialize payment transactions
   - Verify payment status
   - Validate webhook signatures
   - Generate unique payment references

2. **✅ Payment Controller** (`/backend/src/controllers/payment.controller.ts`)
   - `POST /api/payment/initiate` - Initialize wallet funding
   - `GET /api/payment/verify/:reference` - Verify payment
   - `POST /api/payment/webhook` - Handle Monnify webhooks
   - `GET /api/payment/history` - Get payment history
   - Automatic wallet crediting on successful payment

3. **✅ Payment Routes** (`/backend/src/routes/payment.routes.ts`)
   - All payment endpoints registered
   - Authentication middleware applied
   - Webhook endpoint (public)

4. **✅ App Configuration** (`/backend/src/app.ts`)
   - Payment routes registered at `/api/payment`

5. **✅ Environment Configuration** (`/backend/src/.env`)
   - Monnify credentials placeholders added
   - Frontend URL configured

### **Frontend (React Native + Expo)**

1. **✅ Payment Service** (`/frontend/services/payment.service.ts`)
   - Initialize payment
   - Verify payment
   - Get payment history
   - Full TypeScript support

2. **✅ Add Money Screen** (`/frontend/app/add-money.tsx`)
   - Monnify payment option added
   - WebBrowser integration for checkout
   - Custom alerts for success/error
   - Loading states
   - Payment verification flow
   - Automatic navigation after success

---

## 🔑 STEP 1: Get Your Monnify Credentials

### **1.1 Create Monnify Account**

1. Go to: **https://app.monnify.com**
2. Click **"Sign Up"**
3. Fill in your business information
4. Verify your email
5. Complete KYC if required

### **1.2 Get API Credentials**

Once logged in:

1. Navigate to: **Settings → API Keys**
2. Copy the following:
   - **API Key** (e.g., `MK_TEST_xxxxxxxxxxxxx`)
   - **Secret Key** (e.g., `xxxxxxxxxxxxxxxxxxxxx`)
   - **Contract Code** (e.g., `1234567890`)

### **1.3 Choose Environment**

- **Sandbox (Testing)**: `https://sandbox.monnify.com`
- **Live (Production)**: `https://api.monnify.com`

Start with Sandbox for testing!

---

## ⚙️ STEP 2: Configure Backend

### **2.1 Update .env File**

Open `/backend/src/.env` and replace the placeholders:

```bash
# Replace these with your actual Monnify credentials
MONNIFY_API_KEY=MK_TEST_YOUR_API_KEY_HERE
MONNIFY_SECRET_KEY=YOUR_SECRET_KEY_HERE
MONNIFY_CONTRACT_CODE=YOUR_CONTRACT_CODE_HERE
MONNIFY_BASE_URL=https://sandbox.monnify.com

# Make sure this matches your Expo app URL
FRONTEND_URL=http://192.168.43.204:8081
```

**Example with real values:**
```bash
MONNIFY_API_KEY=MK_TEST_SAF7HR5F3F
MONNIFY_SECRET_KEY=4SY6TNL8CK3VPRSBTHTRG2N8XXEGC6NL
MONNIFY_CONTRACT_CODE=1234567890
MONNIFY_BASE_URL=https://sandbox.monnify.com
FRONTEND_URL=http://192.168.43.204:8081
```

### **2.2 Restart Backend Server**

```bash
cd /home/amee/Desktop/VTUApp/backend
npm run dev
```

You should see:
```
✅ Server running on http://localhost:5000
info: MongoDB connected successfully
```

---

## 🌐 STEP 3: Configure Monnify Webhook

### **3.1 Set Webhook URL in Monnify Dashboard**

1. Login to Monnify dashboard
2. Go to: **Settings → API Configuration**
3. Set **Webhook URL** to:
   ```
   http://YOUR_SERVER_IP:5000/api/payment/webhook
   ```

**For local testing with ngrok:**
```bash
# Install ngrok
npm install -g ngrok

# Expose your backend
ngrok http 5000

# Use the ngrok URL in Monnify webhook settings
https://xxxx-xxxx-xxxx.ngrok.io/api/payment/webhook
```

### **3.2 Enable Webhook Events**

Make sure these events are enabled:
- ✅ `SUCCESSFUL_TRANSACTION`
- ✅ `FAILED_TRANSACTION`

---

## 📱 STEP 4: Test the Integration

### **4.1 Start Both Servers**

**Terminal 1 - Backend:**
```bash
cd /home/amee/Desktop/VTUApp/backend
npm run dev
```

**Terminal 2 - Frontend:**
```bash
cd /home/amee/Desktop/VTUApp/frontend
npx expo start
```

### **4.2 Test Payment Flow**

1. **Open app on your phone**
2. **Navigate to Add Money screen**
3. **Select "Card/Bank Transfer" payment method**
4. **Enter amount** (e.g., 1000)
5. **Click "Add Money"**
6. **Complete payment** in the Monnify checkout
7. **Return to app** - wallet should be credited!

### **4.3 Test Card Details (Sandbox)**

Monnify Sandbox Test Cards:

**Successful Payment:**
```
Card Number: 5531886652142950
CVV: 564
Expiry: 09/30
PIN: 3310
OTP: 123456
```

**Failed Payment:**
```
Card Number: 5061020000000000094
CVV: any
Expiry: any future date
```

---

## 🔄 How It Works

### **Payment Flow Diagram**

```
┌─────────────┐
│   User      │
│  (Mobile)   │
└──────┬──────┘
       │ 1. Clicks "Add Money"
       │
       ▼
┌─────────────────────────────────┐
│  Frontend (React Native)         │
│  • Validates amount              │
│  • Shows loading state           │
└──────┬──────────────────────────┘
       │ 2. POST /api/payment/initiate
       │    { amount: 1000 }
       ▼
┌─────────────────────────────────┐
│  Backend (Node.js)               │
│  • Creates transaction (pending)│
│  • Calls Monnify API            │
│  • Returns checkout URL         │
└──────┬──────────────────────────┘
       │ 3. Returns checkout URL
       │
       ▼
┌─────────────────────────────────┐
│  Frontend                        │
│  • Opens Monnify checkout       │
│  • User completes payment       │
└──────┬──────────────────────────┘
       │ 4. Payment successful
       │
       ▼
┌─────────────────────────────────┐
│  Monnify                         │
│  • Processes payment            │
│  • Sends webhook to backend     │
└──────┬──────────────────────────┘
       │ 5. POST /api/payment/webhook
       │    { eventType: "SUCCESSFUL_TRANSACTION" }
       ▼
┌─────────────────────────────────┐
│  Backend                         │
│  • Validates signature          │
│  • Updates transaction          │
│  • Credits wallet               │
└──────┬──────────────────────────┘
       │ 6. Wallet credited
       │
       ▼
┌─────────────────────────────────┐
│  Frontend                        │
│  • Verifies payment             │
│  • Shows success alert          │
│  • Navigates to home            │
└─────────────────────────────────┘
```

---

## 🧪 API Endpoints

### **1. Initialize Payment**

```http
POST /api/payment/initiate
Authorization: Bearer <token>
Content-Type: application/json

{
  "amount": 5000
}
```

**Response:**
```json
{
  "success": true,
  "message": "Payment initialized successfully",
  "data": {
    "transaction": {
      "id": "trans_123",
      "reference": "MNF-user123-1234567890-1234",
      "amount": 5000,
      "status": "pending"
    },
    "payment": {
      "checkoutUrl": "https://checkout.monnify.com/...",
      "transactionReference": "MNFY|20|...",
      "paymentReference": "MNF-user123-1234567890-1234"
    }
  }
}
```

### **2. Verify Payment**

```http
GET /api/payment/verify/:reference
Authorization: Bearer <token>
```

**Response:**
```json
{
  "success": true,
  "message": "Payment verified successfully",
  "data": {
    "status": "paid",
    "transaction": { ... },
    "amountPaid": 5000
  }
}
```

### **3. Payment History**

```http
GET /api/payment/history?page=1&limit=20
Authorization: Bearer <token>
```

**Response:**
```json
{
  "success": true,
  "message": "Payment history retrieved successfully",
  "data": [ ... ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 45,
    "pages": 3
  }
}
```

### **4. Webhook (From Monnify)**

```http
POST /api/payment/webhook
Content-Type: application/json
Monnify-Signature: <signature>

{
  "eventType": "SUCCESSFUL_TRANSACTION",
  "eventData": {
    "transactionReference": "MNFY|20|...",
    "paymentReference": "MNF-user123-1234567890-1234",
    "amountPaid": 5000,
    "paidOn": "2025-11-06T12:30:00",
    "customer": {
      "email": "user@example.com",
      "name": "John Doe"
    }
  }
}
```

---

## 🎨 Frontend Features

### **Add Money Screen Enhancements**

1. **✅ Two Payment Methods**
   - Virtual Account (Bank Transfer)
   - Card/Bank Transfer (Monnify)

2. **✅ Beautiful UI**
   - ATM-style virtual account card
   - Quick amount selection
   - Payment method selection
   - Loading states

3. **✅ Monnify Integration**
   - Opens checkout in browser
   - Automatic payment verification
   - Custom success/error alerts
   - Smooth navigation flow

4. **✅ User Experience**
   - Loading indicators
   - Error handling
   - Success feedback
   - Auto-navigation after payment

---

## 🔒 Security Features

### **Backend Security**

1. **✅ Webhook Signature Validation**
   ```typescript
   validateWebhookSignature(payload, signature)
   ```
   Prevents fake webhook requests

2. **✅ Authentication Required**
   - All payment endpoints require auth token
   - User-specific transactions

3. **✅ Double Credit Prevention**
   - Checks if transaction already processed
   - Prevents duplicate wallet credits

4. **✅ Amount Validation**
   - Min: ₦100
   - Max: ₦1,000,000
   - Server-side validation

### **Frontend Security**

1. **✅ SSL Encryption**
   - All API calls over HTTPS
   - Auth tokens in headers

2. **✅ Payment Verification**
   - Always verifies payment with backend
   - Doesn't trust frontend alone

3. **✅ Secure Storage**
   - Tokens stored in AsyncStorage
   - No sensitive data in plain text

---

## 🐛 Troubleshooting

### **Issue: "Failed to authenticate with Monnify"**

**Solution:**
- Check API Key and Secret Key are correct
- Ensure no extra spaces in .env file
- Verify you're using the right environment (sandbox/live)

### **Issue: "Payment successful but wallet not credited"**

**Solution:**
- Check backend logs for webhook errors
- Verify webhook URL is set in Monnify dashboard
- Check if transaction status is "successful" in database
- Look for duplicate prevention logs

### **Issue: "Cannot open Monnify checkout"**

**Solution:**
- Install expo-web-browser: `npm install expo-web-browser`
- Check internet connection
- Verify checkout URL is valid
- Try on actual device (not simulator)

### **Issue: "Webhook not receiving events"**

**Solution:**
- Use ngrok to expose local server
- Set ngrok URL in Monnify webhook settings
- Check Monnify logs in dashboard
- Verify webhook events are enabled

---

## 📊 Database Changes

### **Transaction Model**

Transactions created with:
```typescript
{
  type: 'wallet_topup',
  payment_method: 'monnify',
  reference_number: 'MNF-...',
  status: 'pending' | 'successful' | 'failed',
  amount: 5000,
  ...
}
```

### **Wallet Updates**

Automatic wallet crediting:
```typescript
await WalletService.creditWallet(userId, amount);
```

---

## 🚀 Going Live

### **Before Going Live:**

1. **✅ Complete Monnify KYC**
   - Submit business documents
   - Wait for approval

2. **✅ Switch to Live Mode**
   ```bash
   MONNIFY_API_KEY=MK_PROD_...
   MONNIFY_SECRET_KEY=your_live_secret
   MONNIFY_CONTRACT_CODE=your_live_contract
   MONNIFY_BASE_URL=https://api.monnify.com
   ```

3. **✅ Update Webhook URL**
   - Use production domain
   - Enable HTTPS

4. **✅ Test Thoroughly**
   - Test with small real amounts
   - Verify all flows work
   - Check webhook delivery

5. **✅ Monitor Transactions**
   - Check Monnify dashboard regularly
   - Monitor backend logs
   - Track wallet balances

---

## ✅ Checklist

### **Setup**
- [ ] Created Monnify account
- [ ] Got API credentials
- [ ] Updated .env file
- [ ] Restarted backend server
- [ ] Set webhook URL in Monnify

### **Testing**
- [ ] Backend server running
- [ ] Frontend app running
- [ ] Can initiate payment
- [ ] Can complete test payment
- [ ] Webhook receives events
- [ ] Wallet gets credited
- [ ] Success alert shows
- [ ] Navigation works

### **Production**
- [ ] Completed Monnify KYC
- [ ] Got live credentials
- [ ] Updated env to live mode
- [ ] Tested with real payments
- [ ] Monitoring in place

---

## 📞 Support

**Monnify Support:**
- Email: support@monnify.com
- Website: https://monnify.com

**Documentation:**
- API Docs: https://developers.monnify.com
- Dashboard: https://app.monnify.com

---

## 🎉 You're All Set!

Just add your Monnify credentials to `.env` and start testing! The entire integration is complete and ready to use.

**Need help?** Check the console logs - they show exactly what's happening at each step! 🚀
