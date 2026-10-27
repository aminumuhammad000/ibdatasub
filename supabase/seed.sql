-- ==============================================================================
-- VTU Application & Admin Dashboard Initial Seed Data for Supabase
-- ==============================================================================

-- 1. Default Admin User (Password: "password" - bcrypt hashed)
-- You can log in with email: admin@example.com, password: password
INSERT INTO admin_users (email, password_hash, first_name, last_name, role, status)
VALUES (
    'admin@example.com',
    '$2b$10$EpRnTzVlqHNP0.fUbXUwSOyuiXe/QLSUG6x8ek5zv66dJepPW5Xeq',
    'Super',
    'Admin',
    'super_admin',
    'active'
) ON CONFLICT (email) DO NOTHING;

-- 2. Default System Settings
INSERT INTO system_settings (type, config)
VALUES (
    'global_config',
    '{
        "payment_gateway": "payrant",
        "notification_email": "admin@ibdata.com.ng",
        "email_config": {
            "smtp_host": "smtp.gmail.com",
            "smtp_port": 587,
            "smtp_user": "admin@ibdata.com.ng",
            "smtp_pass": "",
            "smtp_secure": false,
            "sender_name": "IBDataSub"
        }
    }'::jsonb
) ON CONFLICT (type) DO UPDATE SET config = EXCLUDED.config;

-- 3. Default Referral Settings
INSERT INTO referral_settings (bonus_amount, min_withdrawal, active)
VALUES (100.00, 500.00, true);

-- 4. Default Providers
INSERT INTO providers (name, code, active, priority, supported_services, metadata)
VALUES
(
    'SMEPlug',
    'smeplug',
    true,
    1,
    ARRAY['airtime', 'data'],
    '{"description": "Primary SME provider for cheap data bundles and airtime"}'::jsonb
),
(
    'VTpass',
    'vtpass',
    true,
    2,
    ARRAY['airtime', 'data', 'cable', 'electricity', 'exampin'],
    '{"description": "Secondary provider for utility bills and alternative network plans"}'::jsonb
),
(
    'Topupmate',
    'topupmate',
    false,
    3,
    ARRAY['airtime', 'data'],
    '{"description": "Backup VTU provider"}'::jsonb
) ON CONFLICT (code) DO NOTHING;

-- 5. Default Airtime To Cash Settings
INSERT INTO airtime_to_cash_settings (network, discount_rate, min_amount, max_amount, phone_number, active)
VALUES
('MTN', 20.00, 500.00, 50000.00, '08030000000', true),
('AIRTEL', 20.00, 500.00, 50000.00, '08020000000', true),
('GLO', 25.00, 500.00, 50000.00, '08050000000', true),
('9MOBILE', 25.00, 500.00, 50000.00, '08090000000', true);

-- 6. Sample Funding Accounts (Bank Transfer)
INSERT INTO funding_accounts (bank_name, account_name, accountNumber, instructions, active)
VALUES
('Wema Bank / Monnify', 'IBData Subscriptions Ltd', '7810012345', 'Please include your registered phone number or email as narration.', true),
('Kuda Bank', 'IBData Subscriptions Ltd', '2019928374', 'Instant manual bank transfer. Wallet funded in 5 minutes.', true);

-- 7. Sample Data Plans (MTN, Airtel, Glo, 9mobile)
INSERT INTO pricing_plans (provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active)
VALUES
(1, 'MTN', 51, 'MTN-500MB-SME', 'MTN 500MB SME (30 Days)', 140.00, 135.00, 'DATA', 2.0, 4.0, true),
(1, 'MTN', 52, 'MTN-1GB-SME', 'MTN 1GB SME (30 Days)', 270.00, 260.00, 'DATA', 2.0, 4.0, true),
(1, 'MTN', 53, 'MTN-2GB-SME', 'MTN 2GB SME (30 Days)', 540.00, 520.00, 'DATA', 2.0, 4.0, true),
(1, 'MTN', 54, 'MTN-3GB-SME', 'MTN 3GB SME (30 Days)', 810.00, 780.00, 'DATA', 2.0, 4.0, true),
(1, 'MTN', 55, 'MTN-5GB-SME', 'MTN 5GB SME (30 Days)', 1350.00, 1300.00, 'DATA', 2.0, 4.0, true),
(1, 'MTN', 56, 'MTN-10GB-SME', 'MTN 10GB SME (30 Days)', 2700.00, 2600.00, 'DATA', 2.0, 4.0, true),
(2, 'Airtel', 61, 'AIRTEL-1GB-CG', 'Airtel 1GB Corporate (30 Days)', 280.00, 270.00, 'DATA', 2.0, 3.5, true),
(2, 'Airtel', 62, 'AIRTEL-2GB-CG', 'Airtel 2GB Corporate (30 Days)', 560.00, 540.00, 'DATA', 2.0, 3.5, true),
(3, 'Glo', 71, 'GLO-1GB-CG', 'Glo 1GB Corporate (30 Days)', 250.00, 240.00, 'DATA', 2.0, 4.0, true),
(3, 'Glo', 72, 'GLO-2GB-CG', 'Glo 2GB Corporate (30 Days)', 500.00, 480.00, 'DATA', 2.0, 4.0, true),
(4, '9mobile', 81, '9MOB-1GB-SME', '9mobile 1GB SME (30 Days)', 210.00, 200.00, 'DATA', 2.0, 4.0, true),
(1, 'MTN', NULL, 'MTN-VTU', 'MTN Airtime VTU', 100.00, 97.00, 'AIRTIME', 2.0, 3.0, true),
(2, 'Airtel', NULL, 'AIRTEL-VTU', 'Airtel Airtime VTU', 100.00, 97.50, 'AIRTIME', 2.0, 2.5, true);

-- 8. Sample Support Content
INSERT INTO support_content (content)
VALUES (
    '{
        "phone": "+2348000000000",
        "whatsapp": "+2348000000000",
        "email": "support@ibdata.com.ng",
        "telegram": "https://t.me/ibdata_support",
        "office_address": "Lagos, Nigeria",
        "working_hours": "Mon - Sun: 7:00 AM - 11:00 PM"
    }'::jsonb
);

-- 9. Sample Broadcast Message
INSERT INTO broadcasts (title, message, type)
VALUES
('Welcome to IBDataSub Portal', 'Welcome to the updated VTU dashboard powered by Supabase and Next.js.', 'info'),
('Scheduled MTN Network Maintenance', 'MTN data services may experience slight delays tonight between 2:00 AM and 4:00 AM.', 'warning');
