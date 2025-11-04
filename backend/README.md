- Base URL: http://localhost:5000
- Test (GET): /, /api/auth, /api/users, /api/transactions, /api/admin, /api/notifications, /api/promotions, /api/support, /api/wallet

{
  _id: ObjectId,
  email: String,
  phone_number: String,
  password_hash: String,
  first_name: String,
  last_name: String,
  date_of_birth: Date,
  address: String,
  city: String,
  state: String,
  country: String,
  kyc_status: { type: String, enum: ['pending', 'verified', 'rejected'] },
  kyc_document_id_front_url: String,
  kyc_document_id_back_url: String,
  referral_code: String,
  referred_by: ObjectId, // reference to another User
  biometric_enabled: Boolean,
  status: { type: String, enum: ['active', 'inactive', 'suspended'] },
  created_at: Date,
  updated_at: Date
}

{
  _id: ObjectId,
  user_id: ObjectId, // ref: Users
  balance: Number,
  currency: String,
  last_transaction_at: Date,
  created_at: Date,
  updated_at: Date
}

{
  _id: ObjectId,
  user_id: ObjectId,
  wallet_id: ObjectId,
  type: { type: String, enum: ['airtime_topup', 'data_purchase', 'bill_payment', 'wallet_topup', 'e-pin_purchase'] },
  amount: Number,
  fee: Number,
  total_charged: Number,
  status: { type: String, enum: ['pending', 'successful', 'failed', 'refunded'] },
  reference_number: String,
  description: String,
  payment_method: String,
  destination_account: String,
  operator_id: ObjectId, // ref: Operators
  plan_id: ObjectId, // ref: Plans
  receipt_url: String,
  error_message: String,
  created_at: Date,
  updated_at: Date
}

{
  _id: ObjectId,
  name: String,
  code: String,
  logo_url: String,
  status: { type: String, enum: ['active', 'inactive'] },
  created_at: Date,
  updated_at: Date
}


{
  _id: ObjectId,
  operator_id: ObjectId, // ref: Operators
  name: String,
  price: Number,
  validity: String,
  data_amount: String,
  type: { type: String, enum: ['data', 'airtime'] },
  status: String,
  created_at: Date,
  updated_at: Date
}

{
  _id: ObjectId,
  name: String,
  category: String,
  logo_url: String,
  api_endpoint: String,
  status: { type: String, enum: ['active', 'inactive'] },
  created_at: Date,
  updated_at: Date
}

{
  _id: ObjectId,
  name: String,
  value: Number,
  status: String,
  created_at: Date,
  updated_at: Date
}

{
  _id: ObjectId,
  e_pin_product_id: ObjectId,
  transaction_id: ObjectId,
  pin_code: String,
  serial_number: String,
  status: { type: String, enum: ['available', 'used', 'expired'] },
  purchased_at: Date,
  used_at: Date
}


{
  _id: ObjectId,
  email: String,
  password_hash: String,
  first_name: String,
  last_name: String,
  role_id: ObjectId,
  last_login_at: Date,
  status: { type: String, enum: ['active', 'inactive'] },
  created_at: Date,
  updated_at: Date
}


{
  _id: ObjectId,
  name: String, // Super Admin, Support Agent, etc.
  description: String,
  created_at: Date,
  updated_at: Date
}


{
  _id: ObjectId,
  name: String,
  description: String,
  created_at: Date,
  updated_at: Date
}

{
  _id: ObjectId,
  role_id: ObjectId,
  permission_id: ObjectId
}


{
  _id: ObjectId,
  user_id: ObjectId,
  phone_number: String,
  email: String,
  otp_code: String,
  expires_at: Date,
  is_used: Boolean,
  created_at: Date
}


{
  _id: ObjectId,
  user_id: ObjectId, // nullable
  type: String,
  title: String,
  message: String,
  read_status: Boolean,
  created_at: Date,
  action_link: String
}


{
  _id: ObjectId,
  name: String,
  description: String,
  type: { type: String, enum: ['discount', 'cashback', 'referral_bonus'] },
  start_date: Date,
  end_date: Date,
  code: String,
  status: String,
  target_users: String,
  banner_image_url: String,
  created_at: Date,
  updated_at: Date
}


{
  _id: ObjectId,
  referrer_bonus_amount: Number,
  referee_bonus_amount: Number,
  min_transaction_for_bonus: Number,
  terms_and_conditions_url: String,
  is_active: Boolean,
  created_at: Date,
  updated_at: Date
}


{
  _id: ObjectId,
  user_id: ObjectId,
  admin_id: ObjectId,
  subject: String,
  description: String,
  status: { type: String, enum: ['new', 'open', 'pending_user', 'resolved', 'closed'] },
  priority: { type: String, enum: ['low', 'medium', 'high'] },
  created_at: Date,
  updated_at: Date
}


{
  _id: ObjectId,
  admin_id: ObjectId,
  user_id: ObjectId,
  action: String,
  entity_type: String,
  entity_id: ObjectId,
  old_value: Object,
  new_value: Object,
  ip_address: String,
  timestamp: Date
}


{
  _id: ObjectId,
  email: String,
  phone_number: String,
  password_hash: String,
  first_name: String,
  last_name: String,
  date_of_birth: Date,
  address: String,
  city: String,
  state: String,
  country: String,
  kyc_status: { type: String, enum: ['pending', 'verified', 'rejected'] },
  kyc_document_id_front_url: String,
  kyc_document_id_back_url: String,
  referral_code: String,
  referred_by: ObjectId,
  biometric_enabled: Boolean,
  status: { type: String, enum: ['active', 'inactive', 'suspended'] },
  created_at: Date,
  updated_at: Date
}


{
  _id: ObjectId,
  user_id: ObjectId,
  balance: Number,
  currency: String,
  last_transaction_at: Date,
  created_at: Date,
  updated_at: Date
}


{
  _id: ObjectId,
  user_id: ObjectId,
  wallet_id: ObjectId,
  type: { type: String, enum: ['airtime_topup', 'data_purchase', 'bill_payment', 'wallet_topup', 'e-pin_purchase'] },
  amount: Number,
  fee: Number,
  total_charged: Number,
  status: { type: String, enum: ['pending', 'successful', 'failed', 'refunded'] },
  reference_number: String,
  description: String,
  payment_method: String,
  destination_account: String,
  operator_id: ObjectId,
  plan_id: ObjectId,
  receipt_url: String,
  error_message: String,
  created_at: Date,
  updated_at: Date
}


# Bill Payment API Documentation

## Overview
This API integrates with TopupMate to provide bill payment services including airtime, data bundles, cable TV, electricity, and exam pins.

## Base URL
```
/api/v1/billpayment
```

## Authentication
All endpoints require Bearer token authentication:
```
Authorization: Bearer {your_jwt_token}
```

---

## Endpoints

### 1. Get Networks
Retrieve available network providers.

**Endpoint:** `GET /networks`

**Response:**
```json
{
  "status": "success",
  "message": "Networks retrieved successfully",
  "data": [
    {
      "id": "1",
      "network": "MTN",
      "status": "On"
    },
    {
      "id": "2",
      "network": "AIRTEL",
      "status": "On"
    }
  ]
}
```

---

### 2. Get Data Plans
Retrieve available data plans.

**Endpoint:** `GET /data-plans`

**Response:**
```json
{
  "status": "success",
  "message": "Data plans retrieved successfully",
  "data": [
    {
      "id": "1",
      "network": "MTN",
      "plan": "1GB SME",
      "price": "250",
      "validity": "30 days"
    }
  ]
}
```

---

### 3. Get Cable Providers
Retrieve available cable TV providers.

**Endpoint:** `GET /cable-providers`

**Response:**
```json
{
  "status": "success",
  "message": "Cable providers retrieved successfully",
  "data": [
    {
      "id": "1",
      "provider": "DSTV",
      "status": "On"
    },
    {
      "id": "2",
      "provider": "GOTV",
      "status": "On"
    }
  ]
}
```

---

### 4. Get Electricity Providers
Retrieve available electricity providers.

**Endpoint:** `GET /electricity-providers`

**Response:**
```json
{
  "status": "success",
  "message": "Electricity providers retrieved successfully",
  "data": [
    {
      "id": "1",
      "provider": "EKEDC",
      "status": "On"
    }
  ]
}
```

---

### 5. Purchase Airtime
Purchase airtime for a phone number.

**Endpoint:** `POST /airtime`

**Request Body:**
```json
{
  "network": "1",
  "phone": "08012345678",
  "amount": "100",
  "airtime_type": "VTU",
  "ported_number": true
}
```

**Validation Rules:**
- `network`: Required, string
- `phone`: Required, 10-11 digits
- `amount`: Required, number (min: 50, max: 50000)
- `airtime_type`: Optional, "VTU" or "SHARE_AND_SELL" (default: "VTU")
- `ported_number`: Optional, boolean (default: true)

**Response:**
```json
{
  "status": "success",
  "message": "Airtime purchase successful",
  "data": {
    "transaction": {
      "id": "123",
      "reference": "AIRTIME_1234567890",
      "amount": 100,
      "status": "completed"
    },
    "provider_response": {
      "status": "success",
      "Status": "successful"
    }
  }
}
```

---

### 6. Purchase Data
Purchase data bundle for a phone number.

**Endpoint:** `POST /data`

**Request Body:**
```json
{
  "network": "1",
  "phone": "08012345678",
  "plan": "1",
  "ported_number": true
}
```

**Validation Rules:**
- `network`: Required, string
- `phone`: Required, 10-11 digits
- `plan`: Required, string (plan ID)
- `ported_number`: Optional, boolean (default: true)

**Response:**
```json
{
  "status": "success",
  "message": "Data purchase successful",
  "data": {
    "transaction": {
      "id": "124",
      "reference": "DATA_1234567890",
      "amount": 250,
      "status": "completed"
    },
    "provider_response": {
      "status": "success",
      "Status": "successful",
      "true_response": "MTN SME 1GB for 08012345678..."
    }
  }
}
```

---

### 7. Verify Cable Account
Verify a cable TV IUC number.

**Endpoint:** `POST /cable/verify`

**Request Body:**
```json
{
  "provider": "1",
  "iucnumber": "1234567890"
}
```

**Response:**
```json
{
  "status": "success",
  "message": "Account verification successful",
  "data": {
    "customer_name": "John Doe",
    "iucnumber": "1234567890"
  }
}
```

---

### 8. Purchase Cable TV Subscription
Purchase or renew cable TV subscription.

**Endpoint:** `POST /cable/purchase`

**Request Body:**
```json
{
  "provider": "1",
  "iucnumber": "1234567890",
  "plan": "3",
  "subtype": "renew",
  "phone": "08012345678"
}
```

**Validation Rules:**
- `provider`: Required, string
- `iucnumber`: Required, string
- `plan`: Required, string (plan ID)
- `subtype`: Optional, "renew" or "change" (default: "renew")
- `phone`: Required, 10-11 digits

**Response:**
```json
{
  "status": "success",
  "message": "Cable TV purchase successful",
  "data": {
    "transaction": {
      "id": "125",
      "reference": "CABLE_1234567890",
      "amount": 5000,
      "status": "completed"
    }
  }
}
```

---

### 9. Verify Electricity Meter
Verify an electricity meter number.

**Endpoint:** `POST /electricity/verify`

**Request Body:**
```json
{
  "provider": "1",
  "meternumber": "12345678901",
  "metertype": "prepaid"
}
```

**Validation Rules:**
- `metertype`: Must be "prepaid" or "postpaid"

**Response:**
```json
{
  "status": "success",
  "message": "Meter verification successful",
  "data": {
    "customer_name": "Jane Smith",
    "meternumber": "12345678901"
  }
}
```

---

### 10. Purchase Electricity
Purchase electricity units.

**Endpoint:** `POST /electricity/purchase`

**Request Body:**
```json
{
  "provider": "1",
  "meternumber": "12345678901",
  "amount": "1000",
  "metertype": "prepaid",
  "phone": "08012345678"
}
```

**Validation Rules:**
- `amount`: Required, number (min: 500, max: 100000)
- `metertype`: Required, "prepaid" or "postpaid"

**Response:**
```json
{
  "status": "success",
  "message": "Electricity purchase successful",
  "data": {
    "transaction": {
      "id": "126",
      "reference": "ELECTRIC_1234567890",
      "amount": 1000,
      "status": "completed"
    },
    "token": "1234-5678-9012-3456"
  }
}
```

---

### 11. Purchase Exam Pin
Purchase examination PIN(s).

**Endpoint:** `POST /exampin`

**Request Body:**
```json
{
  "provider": "1",
  "quantity": "2"
}
```

**Validation Rules:**
- `quantity`: Required, integer (min: 1, max: 10)

**Response:**
```json
{
  "status": "success",
  "message": "Exam pin purchase successful",
  "data": {
    "transaction": {
      "id": "127",
      "reference": "EXAMPIN_1234567890",
      "amount": 1000,
      "status": "completed"
    },
    "pins": "123456,789012"
  }
}
```

---

### 12. Get Transaction Status
Check the status of a transaction.

**Endpoint:** `GET /transaction/:reference`

**Parameters:**
- `reference`: Transaction reference (e.g., "DATA_1234567890")

**Response:**
```json
{
  "status": "success",
  "message": "Transaction status retrieved",
  "data": {
    "transref": "DATA_1234567890",
    "amount": "250",
    "status": "success",
    "date": "2024-09-21 21:55:40",
    "service": "Data",
    "description": "MTN SME 1GB for 08012345678..."
  }
}
```

---

## Error Responses

### Validation Error (422)
```json
{
  "status": "error",
  "message": "Validation error",
  "errors": [
    {
      "field": "phone",
      "message": "Phone number must be 10 or 11 digits"
    }
  ]
}
```

### Insufficient Balance (400)
```json
{
  "status": "error",
  "message": "Insufficient wallet balance"
}
```

### Transaction Failed (400)
```json
{
  "status": "error",
  "message": "Data purchase failed",
  "data": {
    "status": "failed",
    "msg": "Transaction failed"
  }
}
```

### Authentication Error (401)
```json
{
  "status": "error",
  "message": "Authentication required"
}
```

---

## Transaction Flow

1. **User initiates purchase** → Request sent to endpoint
2. **Validation** → Request body is validated
3. **Balance check** → User's wallet balance is verified
4. **Wallet debit** → Amount is deducted from wallet
5. **Transaction creation** → Transaction record is created with "pending" status
6. **API call to TopupMate** → Request is sent to provider
7. **Response handling:**
   - **Success:** Transaction updated to "completed"
   - **Failure:** Amount refunded to wallet, transaction marked as "failed"
8. **Response sent** → User receives transaction details

---

## Testing

### Postman Collection
Import this collection to test all endpoints:

```json
{
  "info": {
    "name": "Bill Payment API",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Get Networks",
      "request": {
        "method": "GET",
        "header": [
          {
            "key": "Authorization",
            "value": "Bearer {{token}}"
          }
        ],
        "url": "{{base_url}}/api/v1/billpayment/networks"
      }
    },
    {
      "name": "Purchase Airtime",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Authorization",
            "value": "Bearer {{token}}"
          },
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"network\": \"1\",\n  \"phone\": \"08012345678\",\n  \"amount\": \"100\"\n}"
        },
        "url": "{{base_url}}/api/v1/billpayment/airtime"
      }
    }
  ]
}
```

---

## Best Practices

1. **Always verify accounts** before making purchases (cable, electricity)
2. **Check transaction status** for pending transactions
3. **Store transaction references** for future queries
4. **Handle errors gracefully** and inform users
5. **Log all transactions** for audit purposes
6. **Implement rate limiting** to prevent abuse
7. **Monitor wallet balance** before initiating transactions
8. **Use unique references** for each transaction

---

## Support

For issues or questions:
- Check transaction status using the reference
- Contact support if transaction is pending for more than 5 minutes
- Keep transaction references for dispute resolution

