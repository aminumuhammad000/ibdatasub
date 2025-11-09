// models/admin_role.model.ts
import mongoose, { Schema } from 'mongoose';
import { IAdminRole } from '../types.js';

const adminRoleSchema = new Schema<IAdminRole>({
  name: { type: String, required: true, unique: true },
  description: { type: String },
  created_at: { type: Date, default: Date.now },
  updated_at: { type: Date, default: Date.now }
});

export const AdminRole = mongoose.model<IAdminRole>('AdminRole', adminRoleSchema);
