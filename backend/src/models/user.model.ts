import mongoose, { Schema } from 'mongoose';
import { IUser } from '../types';

const userSchema = new Schema<IUser>({
  email: { type: String, required: true, unique: true },
  phone_number: { type: String, required: true, unique: true },
  password_hash: { type: String, required: true },
  first_name: { type: String, required: true },
  last_name: { type: String, required: true },
  date_of_birth: { type: Date },
  address: { type: String },
  city: { type: String },
  state: { type: String },
  country: { type: String, default: 'Nigeria' },
  kyc_status: { type: String, enum: ['pending', 'verified', 'rejected'], default: 'pending' },
  kyc_document_id_front_url: { type: String },
  kyc_document_id_back_url: { type: String },
  referral_code: { type: String, unique: true, required: true },
  referred_by: { type: Schema.Types.ObjectId, ref: 'User' },
  biometric_enabled: { type: Boolean, default: false },
  status: { type: String, enum: ['active', 'inactive', 'suspended'], default: 'active' },
  created_at: { type: Date, default: Date.now },
  updated_at: { type: Date, default: Date.now }
});

export const User = mongoose.model<IUser>('User', userSchema);