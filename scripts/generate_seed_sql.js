const fs = require('fs');
const path = require('path');
const BSON = require('/tmp/bson-tool/node_modules/bson');

const backupDir = '/tmp/mongodb-backup/backup-2026-07-13/connecta_vtu';
const outDir = path.resolve(__dirname, '../supabase');

function toUuid(mongoId) {
  if (!mongoId) return null;
  const str = String(mongoId).toLowerCase().padStart(32, '0');
  return `${str.slice(0, 8)}-${str.slice(8, 12)}-${str.slice(12, 16)}-${str.slice(16, 20)}-${str.slice(20, 32)}`;
}

function escapeSql(val) {
  if (val === null || val === undefined) return 'NULL';
  if (typeof val === 'number') return isNaN(val) ? '0' : String(val);
  if (typeof val === 'boolean') return val ? 'TRUE' : 'FALSE';
  if (val instanceof Date) return `'${val.toISOString()}'`;
  if (Array.isArray(val)) {
    const items = val.map(v => typeof v === 'string' ? `"${v.replace(/"/g, '\\"')}"` : String(v));
    return `ARRAY[${items.map(s => `'${s.replace(/'/g, "''")}'`).join(', ')}]::text[]`;
  }
  if (typeof val === 'object') {
    return `'${JSON.stringify(val).replace(/'/g, "''")}'::jsonb`;
  }
  return `'${String(val).replace(/'/g, "''")}'`;
}

function readBson(filename) {
  const filePath = path.join(backupDir, filename);
  if (!fs.existsSync(filePath)) return [];
  const buf = fs.readFileSync(filePath);
  if (buf.length === 0) return [];
  const docs = [];
  let offset = 0;
  while (offset < buf.length) {
    const size = buf.readInt32LE(offset);
    if (size <= 0 || offset + size > buf.length) break;
    try {
      docs.push(BSON.deserialize(buf.subarray(offset, offset + size)));
    } catch (e) {
      break;
    }
    offset += size;
  }
  return docs;
}

console.log('Reading MongoDB backup files...');

// 1. Admin Users
const adminUsers1 = readBson('adminusers.bson');
const adminUsers2 = readBson('admin_users.bson');
const adminUsersMap = new Map();
for (const a of [...adminUsers1, ...adminUsers2]) {
  const email = (a.email || '').toLowerCase().trim();
  if (email && !adminUsersMap.has(email)) {
    adminUsersMap.set(email, a);
  }
}
const adminUsers = Array.from(adminUsersMap.values());
console.log(`Loaded ${adminUsers.length} admin users.`);

// 2. Users
const rawUsers = readBson('users.bson');
const userIds = new Set(rawUsers.map(u => String(u._id)));
console.log(`Loaded ${rawUsers.length} raw users.`);

// 3. Wallets
const rawWallets = readBson('wallets.bson');
console.log(`Loaded ${rawWallets.length} wallets.`);

// 4. Missing Users in Wallets (create archived users for them so foreign keys succeed)
const missingUserIds = new Set();
for (const w of rawWallets) {
  const uid = String(w.user_id);
  if (!userIds.has(uid)) {
    missingUserIds.add(uid);
  }
}

// 5. Transactions
const rawTxs = readBson('transactions.bson');
console.log(`Loaded ${rawTxs.length} transactions.`);
for (const t of rawTxs) {
  if (t.user_id && !userIds.has(String(t.user_id))) {
    missingUserIds.add(String(t.user_id));
  }
}
console.log(`Found ${missingUserIds.size} archived/deleted user IDs referenced in wallets/transactions.`);

// Combine users
const allUsers = [...rawUsers];
let archivedCounter = 1;
for (const missingId of missingUserIds) {
  allUsers.push({
    _id: missingId,
    email: `archived_user_${archivedCounter++}@deleted.local`,
    first_name: 'Archived',
    last_name: 'User',
    phone_number: null,
    status: 'inactive',
    kyc_status: 'pending',
    country: 'Nigeria',
    created_at: new Date('2025-11-01T00:00:00Z'),
    updated_at: new Date('2025-11-01T00:00:00Z'),
  });
}

// 6. Pricing Plans (Airtime & Data)
const rawPlans = readBson('airtimeplans.bson');
console.log(`Loaded ${rawPlans.length} pricing plans.`);

// 7. Providers
const rawProviders = readBson('providerconfigs.bson');
console.log(`Loaded ${rawProviders.length} providers.`);

// 8. Airtime to Cash Settings & Requests
const rawA2CSettings = readBson('airtimetocashsettings.bson');
const rawA2CRequests = readBson('airtimetocashrequests.bson');
console.log(`Loaded ${rawA2CSettings.length} A2C settings, ${rawA2CRequests.length} A2C requests.`);

// 9. Referral Settings
const rawReferralSettings = readBson('referralsettings.bson');
console.log(`Loaded ${rawReferralSettings.length} referral settings.`);

// 10. System Settings & Support Content
const rawSystemSettings = readBson('systemsettings.bson');
const rawSupportContent = readBson('supportcontents.bson');
console.log(`Loaded ${rawSystemSettings.length} system settings, ${rawSupportContent.length} support content.`);

// 11. Audit Logs & Notifications
const rawAuditLogs = readBson('auditlogs.bson');
const rawNotifications = readBson('notifications.bson');
console.log(`Loaded ${rawAuditLogs.length} audit logs, ${rawNotifications.length} notifications.`);

// ==================== SQL GENERATION ====================

let coreSql = `-- ==============================================================================
-- MongoDB Backup Migration to Supabase
-- Source: mongodb-backup-2026-07-13.tar.gz
-- Generated: ${new Date().toISOString()}
-- ==============================================================================

-- 1. Insert Admin Users
`;

for (const a of adminUsers) {
  const id = toUuid(a._id);
  const email = a.email;
  const passwordHash = a.password_hash;
  const firstName = a.first_name || 'Admin';
  const lastName = a.last_name || 'User';
  const role = 'super_admin';
  const status = a.status || 'active';
  const lastLoginAt = a.last_login_at ? new Date(a.last_login_at) : null;
  const createdAt = a.created_at ? new Date(a.created_at) : new Date();
  const updatedAt = a.updated_at ? new Date(a.updated_at) : new Date();

  coreSql += `INSERT INTO admin_users (id, email, password_hash, first_name, last_name, role, status, last_login_at, created_at, updated_at)
VALUES (${escapeSql(id)}, ${escapeSql(email)}, ${escapeSql(passwordHash)}, ${escapeSql(firstName)}, ${escapeSql(lastName)}, ${escapeSql(role)}, ${escapeSql(status)}, ${escapeSql(lastLoginAt)}, ${escapeSql(createdAt)}, ${escapeSql(updatedAt)})
ON CONFLICT (email) DO UPDATE SET password_hash = EXCLUDED.password_hash, first_name = EXCLUDED.first_name, last_name = EXCLUDED.last_name;\n`;
}

coreSql += `\n-- 2. Insert Users (${allUsers.length} total users)\n`;
for (const u of allUsers) {
  const id = toUuid(u._id);
  const email = u.email;
  const phone = u.phone_number || null;
  const passwordHash = u.password_hash || null;
  const firstName = u.first_name || 'User';
  const lastName = u.last_name || '';
  const country = u.country || 'Nigeria';
  const kycStatus = ['pending', 'verified', 'rejected'].includes(u.kyc_status) ? u.kyc_status : 'pending';
  const referralCode = u.referral_code || null;
  const referredBy = u.referred_by && userIds.has(String(u.referred_by)) ? toUuid(u.referred_by) : null;
  const biometricEnabled = Boolean(u.biometric_enabled);
  const virtualAccount = u.virtual_account || {};
  const status = ['active', 'inactive', 'suspended'].includes(u.status) ? u.status : 'active';
  const createdAt = u.created_at ? new Date(u.created_at) : new Date();
  const updatedAt = u.updated_at ? new Date(u.updated_at) : new Date();

  coreSql += `INSERT INTO users (id, email, phone_number, password_hash, first_name, last_name, country, kyc_status, referral_code, referred_by, biometric_enabled, virtual_account, status, created_at, updated_at)
VALUES (${escapeSql(id)}, ${escapeSql(email)}, ${escapeSql(phone)}, ${escapeSql(passwordHash)}, ${escapeSql(firstName)}, ${escapeSql(lastName)}, ${escapeSql(country)}, ${escapeSql(kycStatus)}, ${escapeSql(referralCode)}, ${escapeSql(referredBy)}, ${escapeSql(biometricEnabled)}, ${escapeSql(virtualAccount)}, ${escapeSql(status)}, ${escapeSql(createdAt)}, ${escapeSql(updatedAt)})
ON CONFLICT (id) DO UPDATE SET virtual_account = EXCLUDED.virtual_account, status = EXCLUDED.status;\n`;
}

coreSql += `\n-- 3. Insert Wallets (${rawWallets.length} wallets)\n`;
for (const w of rawWallets) {
  const id = toUuid(w._id);
  const userId = toUuid(w.user_id);
  const balance = Number(w.balance || 0);
  const currency = w.currency || 'NGN';
  const lastTxAt = w.last_transaction_at ? new Date(w.last_transaction_at) : null;
  const createdAt = w.created_at ? new Date(w.created_at) : new Date();
  const updatedAt = w.updated_at ? new Date(w.updated_at) : new Date();

  coreSql += `INSERT INTO wallets (id, user_id, balance, currency, last_transaction_at, created_at, updated_at)
VALUES (${escapeSql(id)}, ${escapeSql(userId)}, ${escapeSql(balance)}, ${escapeSql(currency)}, ${escapeSql(lastTxAt)}, ${escapeSql(createdAt)}, ${escapeSql(updatedAt)})
ON CONFLICT (user_id) DO UPDATE SET balance = EXCLUDED.balance, updated_at = EXCLUDED.updated_at;\n`;
}

coreSql += `\n-- 4. Insert Providers (${rawProviders.length} providers)\n`;
for (const p of rawProviders) {
  const id = toUuid(p._id);
  const name = p.name;
  const code = p.code;
  const baseUrl = p.base_url || null;
  const apiKey = p.api_key || null;
  const secretKey = p.secret_key || null;
  const username = p.username || null;
  const password = p.password || null;
  const active = p.active !== undefined ? Boolean(p.active) : true;
  const priority = Number(p.priority || 1);
  const supportedServices = p.supported_services || ['airtime', 'data'];
  const metadata = p.metadata || {};
  const createdAt = p.createdAt ? new Date(p.createdAt) : new Date();
  const updatedAt = p.updatedAt ? new Date(p.updatedAt) : new Date();

  coreSql += `INSERT INTO providers (id, name, code, base_url, api_key, secret_key, username, password, active, priority, supported_services, metadata, created_at, updated_at)
VALUES (${escapeSql(id)}, ${escapeSql(name)}, ${escapeSql(code)}, ${escapeSql(baseUrl)}, ${escapeSql(apiKey)}, ${escapeSql(secretKey)}, ${escapeSql(username)}, ${escapeSql(password)}, ${escapeSql(active)}, ${escapeSql(priority)}, ${escapeSql(supportedServices)}, ${escapeSql(metadata)}, ${escapeSql(createdAt)}, ${escapeSql(updatedAt)})
ON CONFLICT (code) DO UPDATE SET api_key = EXCLUDED.api_key, base_url = EXCLUDED.base_url, metadata = EXCLUDED.metadata;\n`;
}

coreSql += `\n-- 5. Insert Pricing Plans (${rawPlans.length} plans)\n`;
for (const pl of rawPlans) {
  const id = toUuid(pl._id);
  const providerId = Number(pl.providerId || 1);
  const providerName = pl.providerName || 'MTN';
  const externalPlanId = pl.externalPlanId !== undefined ? Number(pl.externalPlanId) : null;
  const code = pl.code ? String(pl.code) : null;
  const name = pl.name;
  const price = Number(pl.price || 0);
  const developerPrice = pl.developer_price !== undefined ? Number(pl.developer_price) : null;
  const type = pl.type === 'AIRTIME' ? 'AIRTIME' : 'DATA';
  const discount = Number(pl.discount || 0);
  const apiDiscount = Number(pl.api_discount || 0);
  const active = pl.active !== undefined ? Boolean(pl.active) : true;
  const createdAt = pl.createdAt ? new Date(pl.createdAt) : new Date();
  const updatedAt = pl.updatedAt ? new Date(pl.updatedAt) : new Date();

  coreSql += `INSERT INTO pricing_plans (id, provider_id, provider_name, external_plan_id, code, name, price, developer_price, type, discount, api_discount, active, created_at, updated_at)
VALUES (${escapeSql(id)}, ${escapeSql(providerId)}, ${escapeSql(providerName)}, ${escapeSql(externalPlanId)}, ${escapeSql(code)}, ${escapeSql(name)}, ${escapeSql(price)}, ${escapeSql(developerPrice)}, ${escapeSql(type)}, ${escapeSql(discount)}, ${escapeSql(apiDiscount)}, ${escapeSql(active)}, ${escapeSql(createdAt)}, ${escapeSql(updatedAt)})
ON CONFLICT (id) DO UPDATE SET price = EXCLUDED.price, name = EXCLUDED.name, active = EXCLUDED.active, api_discount = EXCLUDED.api_discount;\n`;
}

coreSql += `\n-- 6. Insert Airtime To Cash Settings (${rawA2CSettings.length} settings)\n`;
for (const s of rawA2CSettings) {
  const id = toUuid(s._id);
  const network = s.network;
  const discountRate = Number(s.conversion_rate || s.discount_rate || 90);
  const minAmount = Number(s.min_amount || 500);
  const maxAmount = Number(s.max_amount || 100000);
  const phone = s.phone_number ? s.phone_number.trim() : '';
  const active = s.is_active !== undefined ? Boolean(s.is_active) : true;
  const updatedAt = s.updated_at ? new Date(s.updated_at) : new Date();

  coreSql += `INSERT INTO airtime_to_cash_settings (id, network, discount_rate, min_amount, max_amount, phone_number, active, updated_at)
VALUES (${escapeSql(id)}, ${escapeSql(network)}, ${escapeSql(discountRate)}, ${escapeSql(minAmount)}, ${escapeSql(maxAmount)}, ${escapeSql(phone)}, ${escapeSql(active)}, ${escapeSql(updatedAt)})
ON CONFLICT (id) DO UPDATE SET discount_rate = EXCLUDED.discount_rate, phone_number = EXCLUDED.phone_number;\n`;
}

coreSql += `\n-- 7. Insert Airtime To Cash Requests (${rawA2CRequests.length} requests)\n`;
for (const r of rawA2CRequests) {
  const id = toUuid(r._id);
  const userId = toUuid(r.user_id);
  const network = r.network;
  const phone = r.phone_number;
  const amount = Number(r.amount);
  const amountToReceive = Number(r.amount_to_receive);
  const status = ['pending', 'approved', 'rejected'].includes(r.status) ? r.status : 'pending';
  const adminNote = r.admin_note || '';
  const createdAt = r.created_at ? new Date(r.created_at) : new Date();
  const updatedAt = r.updated_at ? new Date(r.updated_at) : new Date();

  coreSql += `INSERT INTO airtime_to_cash_requests (id, user_id, network, phone_number, amount, amount_to_receive, status, admin_note, created_at, updated_at)
VALUES (${escapeSql(id)}, ${escapeSql(userId)}, ${escapeSql(network)}, ${escapeSql(phone)}, ${escapeSql(amount)}, ${escapeSql(amountToReceive)}, ${escapeSql(status)}, ${escapeSql(adminNote)}, ${escapeSql(createdAt)}, ${escapeSql(updatedAt)})
ON CONFLICT (id) DO NOTHING;\n`;
}

coreSql += `\n-- 8. Insert Referral Settings\n`;
if (rawReferralSettings.length > 0) {
  const ref = rawReferralSettings[0];
  const id = toUuid(ref._id);
  const bonus = Number(ref.referrer_bonus_amount || 100);
  const minWithdrawal = Number(ref.min_transaction_for_bonus || 500);
  const active = ref.is_active !== undefined ? Boolean(ref.is_active) : true;

  coreSql += `INSERT INTO referral_settings (id, bonus_amount, min_withdrawal, active)
VALUES (${escapeSql(id)}, ${escapeSql(bonus)}, ${escapeSql(minWithdrawal)}, ${escapeSql(active)})
ON CONFLICT (id) DO UPDATE SET bonus_amount = EXCLUDED.bonus_amount;\n`;
}

coreSql += `\n-- 9. Insert System Settings\n`;
if (rawSystemSettings.length > 0) {
  const sys = rawSystemSettings[0];
  const id = toUuid(sys._id);
  const type = sys.type || 'global_config';
  const config = sys.config || {};

  coreSql += `INSERT INTO system_settings (id, type, config)
VALUES (${escapeSql(id)}, ${escapeSql(type)}, ${escapeSql(config)})
ON CONFLICT (type) DO UPDATE SET config = EXCLUDED.config;\n`;
}

coreSql += `\n-- 10. Insert Support Content\n`;
if (rawSupportContent.length > 0) {
  const sup = rawSupportContent[0];
  const id = toUuid(sup._id);
  const content = {
    email: sup.email || '',
    phoneNumber: sup.phoneNumber || '',
    whatsappNumber: sup.whatsappNumber || '',
    websiteUrl: sup.websiteUrl || '',
    instagramUrl: sup.instagramUrl || '',
    facebookUrl: sup.facebookUrl || '',
    twitterUrl: sup.twitterUrl || '',
  };

  coreSql += `INSERT INTO support_content (id, content)
VALUES (${escapeSql(id)}, ${escapeSql(content)})
ON CONFLICT (id) DO UPDATE SET content = EXCLUDED.content;\n`;
}

coreSql += `\n-- 11. Insert Audit Logs (${rawAuditLogs.length} logs)\n`;
for (const log of rawAuditLogs) {
  const id = toUuid(log._id);
  const adminId = log.admin_id ? toUuid(log.admin_id) : null;
  const userId = log.user_id ? toUuid(log.user_id) : null;
  const action = log.action || 'system';
  const entityType = log.entity_type || 'System';
  const entityId = log.entity_id ? String(log.entity_id) : null;
  const oldValue = log.old_value || null;
  const newValue = log.new_value || null;
  const ipAddress = log.ip_address || null;
  const timestamp = log.timestamp ? new Date(log.timestamp) : new Date();

  coreSql += `INSERT INTO audit_logs (id, admin_id, user_id, action, entity_type, entity_id, old_value, new_value, ip_address, timestamp)
VALUES (${escapeSql(id)}, ${escapeSql(adminId)}, ${escapeSql(userId)}, ${escapeSql(action)}, ${escapeSql(entityType)}, ${escapeSql(entityId)}, ${escapeSql(oldValue)}, ${escapeSql(newValue)}, ${escapeSql(ipAddress)}, ${escapeSql(timestamp)})
ON CONFLICT (id) DO NOTHING;\n`;
}

// Write Core Seed SQL
const coreSqlPath = path.join(outDir, 'seed_data_core.sql');
fs.writeFileSync(coreSqlPath, coreSql);
console.log(`Wrote Core Seed SQL to ${coreSqlPath} (${(coreSql.length / 1024).toFixed(1)} KB)`);

// Generate Transactions SQL in Batches
console.log('Generating Transactions SQL...');
let txSql = `-- ==============================================================================
-- Transactions Seed (${rawTxs.length} historical transactions)
-- ==============================================================================
`;

let batch = [];
const BATCH_SIZE = 250;
let txCount = 0;

for (const t of rawTxs) {
  const id = toUuid(t._id);
  const userId = t.user_id ? toUuid(t.user_id) : null;
  const walletId = t.wallet_id ? toUuid(t.wallet_id) : null;
  const type = t.type || 'airtime_topup';
  const amount = Number(t.amount || 0);
  const fee = Number(t.fee || 0);
  const totalCharged = Number(t.total_charged || amount);
  const status = t.status === 'failed' ? 'failed' : 'successful';
  const referenceNumber = t.reference_number || t.reference || `TX-${id}`;
  const description = t.description || '';
  const paymentMethod = t.payment_method || 'wallet';
  const destinationAccount = t.destination_account || null;
  const createdAt = t.created_at ? new Date(t.created_at) : new Date();
  const updatedAt = t.updated_at ? new Date(t.updated_at) : new Date();

  batch.push(`(${escapeSql(id)}, ${escapeSql(userId)}, ${escapeSql(walletId)}, ${escapeSql(type)}, ${escapeSql(amount)}, ${escapeSql(fee)}, ${escapeSql(totalCharged)}, ${escapeSql(status)}, ${escapeSql(referenceNumber)}, ${escapeSql(description)}, ${escapeSql(paymentMethod)}, ${escapeSql(destinationAccount)}, ${escapeSql(createdAt)}, ${escapeSql(updatedAt)})`);
  txCount++;

  if (batch.length >= BATCH_SIZE) {
    txSql += `INSERT INTO transactions (id, user_id, wallet_id, type, amount, fee, total_charged, status, reference_number, description, payment_method, destination_account, created_at, updated_at)
VALUES\n${batch.join(',\n')}\nON CONFLICT (reference_number) DO NOTHING;\n\n`;
    batch = [];
  }
}

if (batch.length > 0) {
  txSql += `INSERT INTO transactions (id, user_id, wallet_id, type, amount, fee, total_charged, status, reference_number, description, payment_method, destination_account, created_at, updated_at)
VALUES\n${batch.join(',\n')}\nON CONFLICT (reference_number) DO NOTHING;\n\n`;
}

const txSqlPath = path.join(outDir, 'seed_transactions.sql');
fs.writeFileSync(txSqlPath, txSql);
console.log(`Wrote Transactions SQL to ${txSqlPath} (${(txSql.length / (1024 * 1024)).toFixed(2)} MB, ${txCount} rows)`);

// Full combined seed file
const fullSqlPath = path.join(outDir, 'seed_full.sql');
fs.writeFileSync(fullSqlPath, coreSql + '\n' + txSql);
console.log(`Wrote Full Combined Seed SQL to ${fullSqlPath} (${(fs.statSync(fullSqlPath).size / (1024 * 1024)).toFixed(2)} MB)`);
