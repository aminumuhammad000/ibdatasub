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
