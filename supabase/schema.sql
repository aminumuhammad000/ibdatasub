-- ==============================================================================
-- VTU Application & Admin Dashboard Schema for Supabase
-- ==============================================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Function to automatically update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- ==============================================================================
-- 1. Admin Users Table
-- ==============================================================================
CREATE TABLE IF NOT EXISTS admin_users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    role TEXT DEFAULT 'super_admin',
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'suspended')),
    last_login_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TRIGGER update_admin_users_updated_at BEFORE UPDATE ON admin_users
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ==============================================================================
-- 2. Users Table
-- ==============================================================================
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email TEXT UNIQUE NOT NULL,
    phone_number TEXT UNIQUE,
    password_hash TEXT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth DATE,
    address TEXT,
    city TEXT,
    state TEXT,
    country TEXT DEFAULT 'Nigeria',
    profile_picture TEXT,
    kyc_status TEXT DEFAULT 'pending' CHECK (kyc_status IN ('pending', 'verified', 'rejected')),
    kyc_document_id_front_url TEXT,
    kyc_document_id_back_url TEXT,
    referral_code TEXT UNIQUE,
    referred_by UUID REFERENCES users(id) ON DELETE SET NULL,
    biometric_enabled BOOLEAN DEFAULT false,
    nin TEXT,
    bvn TEXT,
    transaction_pin TEXT,
    api_key TEXT UNIQUE,
    api_key_enabled BOOLEAN DEFAULT false,
    virtual_account JSONB DEFAULT '{}'::jsonb,
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'inactive', 'suspended')),
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_phone ON users(phone_number);
CREATE INDEX IF NOT EXISTS idx_users_status ON users(status);
CREATE INDEX IF NOT EXISTS idx_users_kyc_status ON users(kyc_status);

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ==============================================================================
-- 3. Wallets Table
-- ==============================================================================
CREATE TABLE IF NOT EXISTS wallets (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE UNIQUE,
    balance NUMERIC(15, 2) DEFAULT 0.00,
    currency TEXT DEFAULT 'NGN',
    last_transaction_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_wallets_user_id ON wallets(user_id);

CREATE TRIGGER update_wallets_updated_at BEFORE UPDATE ON wallets
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ==============================================================================
-- 4. Transactions Table
-- ==============================================================================
CREATE TABLE IF NOT EXISTS transactions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    wallet_id UUID REFERENCES wallets(id) ON DELETE SET NULL,
    type TEXT NOT NULL, -- 'airtime_topup', 'data_purchase', 'bill_payment', 'wallet_topup', 'e-pin_purchase', 'wallet_credit'
    amount NUMERIC(15, 2) NOT NULL,
    fee NUMERIC(15, 2) DEFAULT 0.00,
    total_charged NUMERIC(15, 2) NOT NULL,
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'successful', 'failed', 'refunded')),
    reference_number TEXT UNIQUE NOT NULL,
    description TEXT,
    payment_method TEXT NOT NULL,
    destination_account TEXT,
    operator_id TEXT,
    plan_id TEXT,
    receipt_url TEXT,
    error_message TEXT,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_transactions_user_id ON transactions(user_id);
CREATE INDEX IF NOT EXISTS idx_transactions_status ON transactions(status);
CREATE INDEX IF NOT EXISTS idx_transactions_type ON transactions(type);
CREATE INDEX IF NOT EXISTS idx_transactions_created_at ON transactions(created_at DESC);

CREATE TRIGGER update_transactions_updated_at BEFORE UPDATE ON transactions
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ==============================================================================
-- 5. Providers Table
-- ==============================================================================
CREATE TABLE IF NOT EXISTS providers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    code TEXT UNIQUE NOT NULL,
    base_url TEXT,
    api_key TEXT,
    secret_key TEXT,
    username TEXT,
    password TEXT,
    active BOOLEAN DEFAULT true,
    priority INT DEFAULT 1,
    supported_services TEXT[] DEFAULT '{}'::text[],
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_providers_code ON providers(code);
CREATE INDEX IF NOT EXISTS idx_providers_active_priority ON providers(active, priority);

CREATE TRIGGER update_providers_updated_at BEFORE UPDATE ON providers
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ==============================================================================
-- 6. Pricing Plans Table (Airtime & Data Plans)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS pricing_plans (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    provider_id INT NOT NULL, -- 1=MTN, 2=Airtel, 3=Glo, 4=9mobile
    provider_name TEXT NOT NULL,
    external_plan_id INT,
    code TEXT,
    name TEXT NOT NULL,
    price NUMERIC(15, 2) NOT NULL,
    developer_price NUMERIC(15, 2),
    type TEXT NOT NULL CHECK (type IN ('AIRTIME', 'DATA')),
    discount NUMERIC(6, 2) DEFAULT 0.00,
    api_discount NUMERIC(6, 2) DEFAULT 0.00,
    meta JSONB DEFAULT '{}'::jsonb,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_pricing_plans_lookup ON pricing_plans(provider_id, type, active);

CREATE TRIGGER update_pricing_plans_updated_at BEFORE UPDATE ON pricing_plans
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ==============================================================================
-- 7. Funding Accounts Table (Manual Bank Transfer Accounts)
-- ==============================================================================
CREATE TABLE IF NOT EXISTS funding_accounts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bank_name TEXT NOT NULL,
    account_name TEXT NOT NULL,
    account_number TEXT NOT NULL,
    instructions TEXT,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TRIGGER update_funding_accounts_updated_at BEFORE UPDATE ON funding_accounts
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- ==============================================================================
-- 8. Audit Logs Table
-- ==============================================================================
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    admin_id UUID,
    user_id UUID,
    action TEXT NOT NULL,
    entity_type TEXT NOT NULL,
    entity_id TEXT,
    old_value JSONB,
    new_value JSONB,
    ip_address TEXT,
    timestamp TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_audit_logs_timestamp ON audit_logs(timestamp DESC);

-- ==============================================================================
-- 9. Notifications & Broadcasts Tables
-- ==============================================================================
CREATE TABLE IF NOT EXISTS notifications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    type TEXT NOT NULL,
    title TEXT NOT NULL,
    message TEXT NOT NULL,
    read_status BOOLEAN DEFAULT false,
    action_link TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS broadcasts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    message TEXT NOT NULL,
    type TEXT NOT NULL DEFAULT 'info',
    action_link TEXT,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- ==============================================================================
-- 10. Airtime To Cash Tables
-- ==============================================================================
CREATE TABLE IF NOT EXISTS airtime_to_cash_requests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    network TEXT NOT NULL,
    phone_number TEXT NOT NULL,
    amount NUMERIC(15, 2) NOT NULL,
    amount_to_receive NUMERIC(15, 2) NOT NULL,
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
    admin_note TEXT,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS airtime_to_cash_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    network TEXT NOT NULL,
    discount_rate NUMERIC(5, 2) NOT NULL,
    min_amount NUMERIC(15, 2) DEFAULT 500,
    max_amount NUMERIC(15, 2) DEFAULT 50000,
    phone_number TEXT NOT NULL,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- ==============================================================================
-- 11. Referral Settings Table
-- ==============================================================================
CREATE TABLE IF NOT EXISTS referral_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bonus_amount NUMERIC(15, 2) DEFAULT 100.00,
    min_withdrawal NUMERIC(15, 2) DEFAULT 500.00,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- ==============================================================================
-- 12. System Settings & Support Content
-- ==============================================================================
CREATE TABLE IF NOT EXISTS system_settings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    type TEXT UNIQUE NOT NULL DEFAULT 'global_config',
    config JSONB NOT NULL DEFAULT '{}'::jsonb,
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS support_content (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    content JSONB NOT NULL DEFAULT '{}'::jsonb,
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- ==============================================================================
-- Row Level Security (RLS) Policies
-- ==============================================================================
ALTER TABLE admin_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE wallets ENABLE ROW LEVEL SECURITY;
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE providers ENABLE ROW LEVEL SECURITY;
ALTER TABLE pricing_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE funding_accounts ENABLE ROW LEVEL SECURITY;
ALTER TABLE audit_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE broadcasts ENABLE ROW LEVEL SECURITY;
ALTER TABLE airtime_to_cash_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE airtime_to_cash_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE referral_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE system_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE support_content ENABLE ROW LEVEL SECURITY;

-- Default permissive policy for service_role and authenticated admins
-- In production, policies can be restricted to specific Supabase Auth roles or JWT claims
CREATE POLICY "Allow service role full access" ON admin_users FOR ALL USING (true);
CREATE POLICY "Allow service role full access users" ON users FOR ALL USING (true);
CREATE POLICY "Allow service role full access wallets" ON wallets FOR ALL USING (true);
CREATE POLICY "Allow service role full access transactions" ON transactions FOR ALL USING (true);
CREATE POLICY "Allow service role full access providers" ON providers FOR ALL USING (true);
CREATE POLICY "Allow service role full access pricing_plans" ON pricing_plans FOR ALL USING (true);
CREATE POLICY "Allow service role full access funding_accounts" ON funding_accounts FOR ALL USING (true);
CREATE POLICY "Allow service role full access audit_logs" ON audit_logs FOR ALL USING (true);
CREATE POLICY "Allow service role full access notifications" ON notifications FOR ALL USING (true);
CREATE POLICY "Allow service role full access broadcasts" ON broadcasts FOR ALL USING (true);
CREATE POLICY "Allow service role full access airtime_to_cash_requests" ON airtime_to_cash_requests FOR ALL USING (true);
CREATE POLICY "Allow service role full access airtime_to_cash_settings" ON airtime_to_cash_settings FOR ALL USING (true);
CREATE POLICY "Allow service role full access referral_settings" ON referral_settings FOR ALL USING (true);
CREATE POLICY "Allow service role full access system_settings" ON system_settings FOR ALL USING (true);
CREATE POLICY "Allow service role full access support_content" ON support_content FOR ALL USING (true);
