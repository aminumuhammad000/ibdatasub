# 🚀 Supabase Setup & MongoDB Migration Guide for IBData / Marabusdata

This project uses **Supabase** (PostgreSQL + Auth + Storage + Realtime) for backend data storage and **Next.js** for the Admin Dashboard.

---

## 1. Supabase Project Details

* **Project URL:** `https://ktjqbsoyuukmpvehcdkp.supabase.co`
* **API Publishable Key:** `sb_publishable_ceITR7XipG_dBI7KnBAnZA_RrVBYtjp`

---

## 2. Run Database Schema & Seed Data

In your Supabase Dashboard:
👉 **[Open Supabase SQL Editor](https://supabase.com/dashboard/project/ktjqbsoyuukmpvehcdkp/sql)**

### Step 2.1: Create Database Tables (Schema)
1. Open [`supabase/schema.sql`](supabase/schema.sql) in this repository.
2. Copy all content, paste into the SQL Editor, and click **Run**.
   - Creates all tables: `admin_users`, `users`, `wallets`, `transactions`, `pricing_plans`, `providers`, `funding_accounts`, `audit_logs`, `notifications`, `broadcasts`, `airtime_to_cash_requests`, `airtime_to_cash_settings`, `referral_settings`, `system_settings`, `support_content`.

### Step 2.2: Seed Data from MongoDB Backup
From `mongodb-backup-2026-07-13.tar.gz`, the production data has been converted to PostgreSQL:

1. **Core Data Seed ([`supabase/seed_data_core.sql`](supabase/seed_data_core.sql)) (~475 KB):**
   - Copy and paste into the SQL Editor, then click **Run**.
   - Imports:
     - **3 Admin Users** (including `murabusdatas@gmail.com` and `admin@vtuapp.com`)
     - **315 Users** (with virtual accounts, phone numbers, referral codes)
     - **315 Wallets** (with exact live balances)
     - **66 Pricing Plans** (MTN, Glo, Airtel, 9mobile data & airtime plans)
     - **1 Provider** (SME Plug with live API key & config)
     - **2 Airtime-to-Cash Settings & 15 Requests**
     - **Referral Settings & System Settings** (payment gateway, smtp)
     - **Support Content** (WhatsApp, phone, social links)
     - **300 Audit Logs**

2. **Historical Transactions ([`supabase/seed_transactions.sql`](supabase/seed_transactions.sql)) (~5.2 MB):**
   - Contains all **17,340 historical transactions** (batched in 250-row chunks with `ON CONFLICT DO NOTHING`).
   - If pasting into the Supabase web SQL editor, you can run it directly, or run it via `psql` / Supabase CLI.

---

## 3. Admin Login Credentials

You can log in to the Next.js Admin Dashboard with:

* **Email:** `murabusdatas@gmail.com`
* **Password:** `Murabus2026`
* **Secondary Admin:** `admin@connectavtu.com` / `Admin@123456`

---

## 4. Run the Apps

### Admin & Landing (Next.js)
```bash
npm run dev
# App runs on http://localhost:3000
# Landing page: http://localhost:3000/
# Admin portal: http://localhost:3000/admin
```

### Mobile App (Expo / React Native)
```bash
cd frontend
npx expo start
```
