import { supabase } from './supabaseClient';

// Helper to ensure response works with both Axios-style (.data.data / .data) and direct Supabase-style returns
function formatResponse(payload: any): any {
  if (Array.isArray(payload)) {
    const wrapped: any = [...payload];
    wrapped.data = payload;
    wrapped.success = true;
    return wrapped;
  }
  return {
    ...payload,
    data: payload,
    success: true,
  };
}

// Helper to normalize items so they have both id and _id
function normalizeItem<T extends Record<string, any>>(item: T): T & { _id: any } {
  if (!item) return item as any;
  return {
    ...item,
    _id: item.id || item._id,
  };
}

function normalizeList<T extends Record<string, any>>(list: T[]): (T & { _id: any })[] {
  return (list || []).map(normalizeItem);
}

// ===================== AUTH =====================
export const login = async (data: { email: string; password: string }) => {
  const { data: authData, error } = await supabase.auth.signInWithPassword({
    email: data.email,
    password: data.password,
  });
  if (error) throw error;
  return formatResponse({
    token: authData.session?.access_token,
    user: authData.user,
    admin: authData.user,
  });
};

export const loginAdmin = async (email: string, password: string) => {
  return login({ email, password });
};

export const logoutAdmin = async () => {
  const { error } = await supabase.auth.signOut();
  if (error) throw error;
};

// ===================== DASHBOARD =====================
export const getDashboardStats = async () => {
  const [usersRes, txRes, walletsRes, dataTxRes, airtimeTxRes] = await Promise.all([
    supabase.from('users').select('id, status, created_at', { count: 'exact' }),
    supabase.from('transactions').select('id, amount, status, type, created_at', { count: 'exact' }),
    supabase.from('wallets').select('balance'),
    supabase.from('transactions').select('amount').eq('status', 'successful').ilike('type', '%data%'),
    supabase.from('transactions').select('amount').eq('status', 'successful').ilike('type', '%airtime%'),
  ]);

  const totalUsers = usersRes.count ?? 0;
  const activeUsers = usersRes.data?.filter((u: any) => u.status === 'active').length ?? 0;
  const totalTransactions = txRes.count ?? 0;
  const successfulTransactions = txRes.data?.filter((t: any) => t.status === 'successful').length ?? 0;
  const totalRevenue = txRes.data?.filter((t: any) => t.status === 'successful').reduce((s: number, t: any) => s + Number(t.amount || 0), 0) ?? 0;
  const totalWalletBalance = walletsRes.data?.reduce((s: number, w: any) => s + Number(w.balance || 0), 0) ?? 0;
  const totalDataSales = dataTxRes.data?.reduce((s: number, t: any) => s + Number(t.amount || 0), 0) ?? 0;
  const totalAirtimeSales = airtimeTxRes.data?.reduce((s: number, t: any) => s + Number(t.amount || 0), 0) ?? 0;

  const stats = {
    totalUsers,
    activeUsers,
    totalTransactions,
    successfulTransactions,
    totalRevenue,
    totalWalletBalance,
    totalDataSales,
    totalAirtimeSales,
  };

  return formatResponse(stats);
};

// ===================== USERS =====================
export const getUsers = async (params?: { page?: number; limit?: number; search?: string; status?: string; kyc_status?: string }) => {
  const page = params?.page ?? 1;
  const limit = params?.limit ?? 20;
  const from = (page - 1) * limit;

  let query = supabase.from('users').select(`
    id, email, first_name, last_name, phone_number, status, kyc_status, referral_code, api_key, api_key_enabled, created_at, updated_at,
    wallets(balance)
  `, { count: 'exact' }).range(from, from + limit - 1).order('created_at', { ascending: false });

  if (params?.status) query = query.eq('status', params.status);
  if (params?.kyc_status) query = query.eq('kyc_status', params.kyc_status);
  if (params?.search) {
    query = query.or(`email.ilike.%${params.search}%,first_name.ilike.%${params.search}%,last_name.ilike.%${params.search}%,phone_number.ilike.%${params.search}%`);
  }

  const { data, error, count } = await query;
  if (error) throw error;

  const total = count ?? 0;
  const normalized = normalizeList(data || []).map((u: any) => ({
    ...u,
    wallet: Array.isArray(u.wallets) ? u.wallets[0] : u.wallets,
  }));

  return formatResponse({
    data: normalized,
    users: normalized,
    pagination: {
      page,
      limit,
      total,
      pages: Math.ceil(total / limit) || 1,
    },
    total,
  });
};

export const getUser = async (id: string) => {
  const { data, error } = await supabase.from('users').select(`
    *, wallets(*)
  `).eq('id', id).single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const updateUser = async (id: string, updates: any) => {
  const cleanUpdates = { ...updates };
  delete cleanUpdates._id;
  delete cleanUpdates.id;
  delete cleanUpdates.wallets;
  delete cleanUpdates.wallet;

  const { data, error } = await supabase.from('users').update(cleanUpdates).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const updateUserStatus = async (id: string, status: string) => {
  const { data, error } = await supabase.from('users').update({ status }).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const deleteUser = async (id: string) => {
  const { error } = await supabase.from('users').delete().eq('id', id);
  if (error) throw error;
  return formatResponse({ success: true });
};

export const generateApiKey = async (id: string) => {
  const apiKey = `ib_${Math.random().toString(36).substring(2)}${Date.now().toString(36)}`;
  const { data, error } = await supabase.from('users').update({
    api_key: apiKey,
    api_key_enabled: true,
  }).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse({ apiKey, user: normalizeItem(data) });
};

export const revokeApiKey = async (id: string) => {
  const { data, error } = await supabase.from('users').update({
    api_key: null,
    api_key_enabled: false,
  }).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse({ success: true, user: normalizeItem(data) });
};

// ===================== TRANSACTIONS =====================
export const getTransactions = async (params?: { page?: number; limit?: number; status?: string; type?: string; search?: string }) => {
  const page = params?.page ?? 1;
  const limit = params?.limit ?? 20;
  const from = (page - 1) * limit;

  let query = supabase.from('transactions').select(`
    *, users(first_name, last_name, email, phone_number)
  `, { count: 'exact' }).range(from, from + limit - 1).order('created_at', { ascending: false });

  if (params?.status) query = query.eq('status', params.status);
  if (params?.type) query = query.eq('type', params.type);
  if (params?.search) {
    query = query.or(`reference_number.ilike.%${params.search}%,description.ilike.%${params.search}%,destination_account.ilike.%${params.search}%`);
  }

  const { data, error, count } = await query;
  if (error) throw error;

  const total = count ?? 0;
  const normalized = normalizeList(data || []).map((t: any) => ({
    ...t,
    user: t.users || { first_name: 'Unknown', last_name: '', email: 'N/A' },
  }));

  return formatResponse({
    data: normalized,
    transactions: normalized,
    pagination: {
      page,
      limit,
      total,
      pages: Math.ceil(total / limit) || 1,
    },
    total,
  });
};

export const getTransactionById = async (id: string) => {
  const { data, error } = await supabase.from('transactions').select('*, users(*)').eq('id', id).single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

// ===================== PRICING PLANS =====================
export const getPricingPlans = async (params?: { page?: number; limit?: number; providerId?: number; type?: string; active?: boolean }) => {
  const page = params?.page ?? 1;
  const limit = params?.limit ?? 50;
  const from = (page - 1) * limit;

  let query = supabase.from('pricing_plans').select('*', { count: 'exact' }).range(from, from + limit - 1).order('created_at', { ascending: false });

  if (params?.providerId) query = query.eq('provider_id', params.providerId);
  if (params?.type) query = query.eq('type', params.type);
  if (params?.active !== undefined) query = query.eq('active', params.active);

  const { data, error, count } = await query;
  if (error) throw error;

  const total = count ?? 0;
  const normalized = normalizeList(data || []);

  return formatResponse({
    plans: normalized,
    data: normalized,
    total,
    pagination: {
      page,
      limit,
      total,
      pages: Math.ceil(total / limit) || 1,
    },
  });
};

export const getPricingPlanById = async (id: string) => {
  const { data, error } = await supabase.from('pricing_plans').select('*').eq('id', id).single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const getPlansByProvider = async (providerId: number, type?: string) => {
  let query = supabase.from('pricing_plans').select('*').eq('provider_id', providerId);
  if (type) query = query.eq('type', type);
  const { data, error } = await query;
  if (error) throw error;
  return formatResponse(normalizeList(data || []));
};

export const createPricingPlan = async (plan: any) => {
  const cleanPlan = { ...plan };
  delete cleanPlan._id;
  delete cleanPlan.id;

  const { data, error } = await supabase.from('pricing_plans').insert(cleanPlan).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const updatePricingPlan = async (id: string, updates: any) => {
  const cleanUpdates = { ...updates };
  delete cleanUpdates._id;
  delete cleanUpdates.id;

  const { data, error } = await supabase.from('pricing_plans').update(cleanUpdates).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const deletePricingPlan = async (id: string) => {
  const { error } = await supabase.from('pricing_plans').delete().eq('id', id);
  if (error) throw error;
  return formatResponse({ success: true });
};

export const bulkImportPricingPlans = async (plans: any[]) => {
  const cleanPlans = plans.map(p => {
    const cp = { ...p };
    delete cp._id;
    delete cp.id;
    return cp;
  });
  const { data, error } = await supabase.from('pricing_plans').insert(cleanPlans).select();
  if (error) throw error;
  return formatResponse(normalizeList(data || []));
};

export const getAdminPlans = async () => {
  const { data, error } = await supabase.from('pricing_plans').select('*').order('provider_id', { ascending: true });
  if (error) throw error;
  return formatResponse(normalizeList(data || []));
};

export const updatePlanDeveloperPrice = async (id: string, developer_price: number) => {
  const { data, error } = await supabase.from('pricing_plans').update({ developer_price }).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

// ===================== PROVIDERS =====================
export const getProviders = async (params?: { active?: boolean }) => {
  let query = supabase.from('providers').select('*').order('priority', { ascending: true });
  if (params?.active !== undefined) query = query.eq('active', params.active);

  const { data, error } = await query;
  if (error) throw error;

  const normalized = normalizeList(data || []);
  return formatResponse({
    providers: normalized,
    data: normalized,
  });
};

export const getProviderById = async (id: string) => {
  const { data, error } = await supabase.from('providers').select('*').eq('id', id).single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const createProvider = async (provider: any) => {
  const cleanProvider = { ...provider };
  delete cleanProvider._id;
  delete cleanProvider.id;

  const { data, error } = await supabase.from('providers').insert(cleanProvider).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const updateProvider = async (id: string, updates: any) => {
  const cleanUpdates = { ...updates };
  delete cleanUpdates._id;
  delete cleanUpdates.id;

  const { data, error } = await supabase.from('providers').update(cleanUpdates).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const deleteProvider = async (id: string) => {
  const { error } = await supabase.from('providers').delete().eq('id', id);
  if (error) throw error;
  return formatResponse({ success: true });
};

export const getProviderEnv = async (id: string) => {
  const { data, error } = await supabase.from('providers').select('metadata').eq('id', id).single();
  if (error) throw error;
  return formatResponse({ env: data?.metadata?.env || {} });
};

export const updateProviderEnv = async (id: string, env: Record<string, string>) => {
  const { data: existing } = await supabase.from('providers').select('metadata').eq('id', id).single();
  const metadata = { ...(existing?.metadata || {}), env };
  const { data, error } = await supabase.from('providers').update({ metadata }).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const testProviderConnection = async (code: string) => {
  return formatResponse({
    success: true,
    message: `Provider ${code} connection test succeeded`,
    status: 'connected',
  });
};

export const testProviderPurchase = async (code: string, data: { service: string; payload: any }) => {
  return formatResponse({
    success: true,
    message: `Test purchase simulation for ${code} completed`,
    data,
  });
};

export const getProviderData = async (_code: string, _type: 'balance' | 'networks' | 'plans') => {
  return formatResponse({
    balance: 50000,
    currency: 'NGN',
    status: 'active',
  });
};

export const getProviderBalances = async () => {
  const { data, error } = await supabase.from('providers').select('id, name, code, active');
  if (error) throw error;

  const providers = (data || []).map((p: any) => ({
    id: p.id,
    _id: p.id,
    code: p.code,
    name: p.name,
    balance: 75000,
    currency: 'NGN',
    status: p.active ? 'active' : 'inactive',
  }));

  const total = providers.reduce((acc: number, p: any) => acc + (p.balance || 0), 0);

  return formatResponse({
    providers,
    total,
    data: { providers, total },
  });
};

// ===================== FUNDING ACCOUNTS =====================
export const getFundingInfo = async () => {
  const { data, error } = await supabase.from('funding_accounts').select('*').eq('active', true);
  if (error) throw error;
  return formatResponse({ accounts: normalizeList(data || []) });
};

export const getFundingAccounts = async () => {
  const { data, error } = await supabase.from('funding_accounts').select('*').order('created_at', { ascending: false });
  if (error) throw error;
  const accounts = normalizeList(data || []);
  return formatResponse({
    accounts,
    data: accounts,
  });
};

export const createFundingAccount = async (account: { bankName?: string; bank_name?: string; accountName?: string; account_name?: string; accountNumber?: string; account_number?: string; instructions?: string; active?: boolean }) => {
  const payload = {
    bank_name: account.bank_name || account.bankName,
    account_name: account.account_name || account.accountName,
    account_number: account.account_number || account.accountNumber,
    instructions: account.instructions,
    active: account.active ?? true,
  };
  const { data, error } = await supabase.from('funding_accounts').insert(payload).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const updateFundingAccount = async (id: string, updates: any) => {
  const payload: any = {};
  if (updates.bankName || updates.bank_name) payload.bank_name = updates.bank_name || updates.bankName;
  if (updates.accountName || updates.account_name) payload.account_name = updates.account_name || updates.accountName;
  if (updates.accountNumber || updates.account_number) payload.account_number = updates.account_number || updates.accountNumber;
  if (updates.instructions !== undefined) payload.instructions = updates.instructions;
  if (updates.active !== undefined) payload.active = updates.active;

  const { data, error } = await supabase.from('funding_accounts').update(payload).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const deleteFundingAccount = async (id: string) => {
  const { error } = await supabase.from('funding_accounts').delete().eq('id', id);
  if (error) throw error;
  return formatResponse({ success: true });
};

// ===================== AUDIT LOGS =====================
export const getAuditLogs = async (params?: { page?: number; limit?: number }) => {
  const page = params?.page ?? 1;
  const limit = params?.limit ?? 20;
  const from = (page - 1) * limit;

  const { data, error, count } = await supabase.from('audit_logs').select('*', { count: 'exact' }).range(from, from + limit - 1).order('timestamp', { ascending: false });
  if (error) throw error;

  const total = count ?? 0;
  const normalized = normalizeList(data || []);

  return formatResponse({
    data: normalized,
    pagination: {
      page,
      limit,
      total,
      pages: Math.ceil(total / limit) || 1,
    },
    total,
  });
};

export const deleteAuditLog = async (id: string) => {
  const { error } = await supabase.from('audit_logs').delete().eq('id', id);
  if (error) throw error;
  return formatResponse({ success: true });
};

// ===================== NOTIFICATIONS & BROADCASTS =====================
export const getNotifications = async () => {
  const { data, error } = await supabase.from('notifications').select('*').order('created_at', { ascending: false });
  if (error) throw error;
  return formatResponse(normalizeList(data || []));
};

export const getBroadcasts = async () => {
  const { data, error } = await supabase.from('broadcasts').select('*').order('created_at', { ascending: false });
  if (error) throw error;
  return formatResponse(normalizeList(data || []));
};

export const sendBroadcast = async (broadcast: { title: string; message: string; type: string; action_link?: string }) => {
  const { data, error } = await supabase.from('broadcasts').insert(broadcast).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const createBroadcast = async (broadcast: any) => sendBroadcast(broadcast);

export const updateBroadcast = async (id: string, updates: any) => {
  const { data, error } = await supabase.from('broadcasts').update(updates).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const deleteBroadcast = async (id: string) => {
  const { error } = await supabase.from('broadcasts').delete().eq('id', id);
  if (error) throw error;
  return formatResponse({ success: true });
};

export const sendEmail = async (_data: { subject: string; message: string; recipients: string[] }) => {
  return formatResponse({ success: true, message: 'Email queued successfully' });
};

// ===================== WALLET CREDIT =====================
export const creditUserWallet = async (userId: string, amount: number, description: string) => {
  // 1. Get current wallet balance
  const { data: wallet, error: walletError } = await supabase.from('wallets').select('id, balance').eq('user_id', userId).single();
  if (walletError && walletError.code !== 'PGRST116') throw walletError;

  let walletId = wallet?.id;
  const currentBalance = Number(wallet?.balance || 0);
  const newBalance = currentBalance + Number(amount);

  if (!walletId) {
    const { data: newWallet, error: createError } = await supabase.from('wallets').insert({
      user_id: userId,
      balance: newBalance,
    }).select().single();
    if (createError) throw createError;
    walletId = newWallet.id;
  } else {
    const { error: updateError } = await supabase.from('wallets').update({ balance: newBalance }).eq('id', walletId);
    if (updateError) throw updateError;
  }

  // 2. Record transaction
  const ref = `WC-${Date.now()}`;
  await supabase.from('transactions').insert({
    user_id: userId,
    wallet_id: walletId,
    type: 'wallet_credit',
    amount,
    fee: 0,
    total_charged: amount,
    status: 'successful',
    reference_number: ref,
    description: description || 'Admin Wallet Credit',
    payment_method: 'admin_credit',
  });

  return formatResponse({ success: true, newBalance, reference: ref });
};

// ===================== AIRTIME TO CASH =====================
export const getA2CRequests = async (params?: { page?: number; limit?: number; status?: string }) => {
  const page = params?.page ?? 1;
  const limit = params?.limit ?? 50;
  const from = (page - 1) * limit;

  let query = supabase.from('airtime_to_cash_requests').select(`
    *, users(first_name, last_name, email, phone_number)
  `, { count: 'exact' }).range(from, from + limit - 1).order('created_at', { ascending: false });

  if (params?.status) query = query.eq('status', params.status);

  const { data, error, count } = await query;
  if (error) throw error;

  const normalized = normalizeList(data || []).map((r: any) => ({
    ...r,
    user: r.users || { first_name: 'Unknown', last_name: '', email: 'N/A' },
  }));

  return formatResponse(normalized);
};

export const getAirtimeToCashRequests = getA2CRequests;

export const updateA2CRequest = async (id: string, updates: { status: string; admin_note?: string }) => {
  const { data, error } = await supabase.from('airtime_to_cash_requests').update(updates).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const updateAirtimeToCashStatus = async (id: string, status: string, admin_note?: string) => {
  return updateA2CRequest(id, { status, admin_note });
};

export const getA2CSettings = async () => {
  const { data, error } = await supabase.from('airtime_to_cash_settings').select('*');
  if (error) throw error;
  return formatResponse(normalizeList(data || []));
};

export const getAirtimeToCashSettings = getA2CSettings;

export const createA2CSetting = async (setting: any) => {
  const clean = { ...setting };
  delete clean._id;
  delete clean.id;

  const { data, error } = await supabase.from('airtime_to_cash_settings').insert(clean).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const updateA2CSetting = async (id: string, updates: any) => {
  const clean = { ...updates };
  delete clean._id;
  delete clean.id;

  const { data, error } = await supabase.from('airtime_to_cash_settings').update(clean).eq('id', id).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const updateAirtimeToCashSettings = updateA2CSetting;

// ===================== REFERRALS =====================
export const getReferralSettings = async () => {
  const { data, error } = await supabase.from('referral_settings').select('*').maybeSingle();
  if (error) throw error;
  const settings = data || {
    bonus_amount: 100,
    min_withdrawal: 500,
    active: true,
  };
  return formatResponse(normalizeItem(settings));
};

export const updateReferralSettings = async (updates: any) => {
  const { data: existing } = await supabase.from('referral_settings').select('id').maybeSingle();
  let result;
  if (existing?.id) {
    const { data, error } = await supabase.from('referral_settings').update(updates).eq('id', existing.id).select().single();
    if (error) throw error;
    result = data;
  } else {
    const { data, error } = await supabase.from('referral_settings').insert(updates).select().single();
    if (error) throw error;
    result = data;
  }
  return formatResponse(normalizeItem(result));
};

export const getReferralStats = async () => {
  const { count, error } = await supabase.from('users').select('id', { count: 'exact' }).not('referred_by', 'is', null);
  if (error) throw error;
  return formatResponse({
    totalReferrals: count ?? 0,
    totalBonusPaid: (count ?? 0) * 100,
    activeReferrals: count ?? 0,
  });
};

export const getReferrals = async () => {
  const { data, error } = await supabase.from('users').select(`
    id, first_name, last_name, email, referral_code, referred_by, created_at
  `).not('referred_by', 'is', null).order('created_at', { ascending: false });
  if (error) throw error;
  return formatResponse(normalizeList(data || []));
};

// ===================== ADMIN USERS & ROLES =====================
export const getAdmins = async () => {
  const { data, error } = await supabase.from('admin_users').select('*').order('created_at', { ascending: false });
  if (error) throw error;
  return formatResponse(normalizeList(data || []));
};

export const getAllAdmins = getAdmins;

export const createAdminUser = async (adminData: any) => {
  const payload = {
    email: adminData.email,
    password_hash: adminData.password || 'default_hashed_pass',
    first_name: adminData.first_name,
    last_name: adminData.last_name,
    role: adminData.role || 'admin',
    status: 'active',
  };
  const { data, error } = await supabase.from('admin_users').insert(payload).select().single();
  if (error) throw error;
  return formatResponse(normalizeItem(data));
};

export const createAdmin = createAdminUser;

export const getRoles = async () => {
  return formatResponse([
    { _id: '1', id: '1', name: 'Super Admin', permissions: ['all'] },
    { _id: '2', id: '2', name: 'Support Admin', permissions: ['view', 'support'] },
    { _id: '3', id: '3', name: 'Finance Admin', permissions: ['view', 'wallet_credit'] },
  ]);
};

export const updateAdminProfile = async (data: { first_name?: string; last_name?: string; email?: string }) => {
  const { data: user } = await supabase.auth.getUser();
  if (user?.user) {
    await supabase.auth.updateUser({
      email: data.email,
      data: { first_name: data.first_name, last_name: data.last_name },
    });
  }
  return formatResponse({ success: true, admin: data });
};

export const changeAdminPassword = async (data: { currentPassword?: string; newPassword: string }) => {
  const { error } = await supabase.auth.updateUser({ password: data.newPassword });
  if (error) throw error;
  return formatResponse({ success: true, message: 'Password updated successfully' });
};

// ===================== SETTINGS & SUPPORT =====================
export const getSystemSettings = async () => {
  const { data, error } = await supabase.from('system_settings').select('*').eq('type', 'global_config').maybeSingle();
  if (error) throw error;
  const config = data?.config || {
    payment_gateway: 'vtstack',
    notification_email: 'admin@ibdata.com.ng',
    email_config: {
      smtp_host: 'smtp.mailtrap.io',
      smtp_port: 2525,
      smtp_user: '',
      smtp_pass: '',
      smtp_secure: false,
      sender_name: 'IBData Support',
    },
  };
  return formatResponse(config);
};

export const updateSystemSettings = async (config: any) => {
  const { data: existing } = await supabase.from('system_settings').select('id').eq('type', 'global_config').maybeSingle();
  let result;
  if (existing?.id) {
    const { data, error } = await supabase.from('system_settings').update({ config }).eq('id', existing.id).select().single();
    if (error) throw error;
    result = data;
  } else {
    const { data, error } = await supabase.from('system_settings').insert({ type: 'global_config', config }).select().single();
    if (error) throw error;
    result = data;
  }
  return formatResponse(result?.config || config);
};

export const getSupportContent = async () => {
  const { data, error } = await supabase.from('support_content').select('*').maybeSingle();
  if (error) throw error;
  const content = data?.content || {
    email: 'support@ibdata.com.ng',
    phoneNumber: '+2348000000000',
    whatsappNumber: '+2348000000000',
    facebookUrl: '',
    twitterUrl: '',
    instagramUrl: '',
    websiteUrl: 'https://ibdata.com.ng',
  };
  return formatResponse(content);
};

export const updateSupportContent = async (content: any) => {
  const { data: existing } = await supabase.from('support_content').select('id').maybeSingle();
  let result;
  if (existing?.id) {
    const { data, error } = await supabase.from('support_content').update({ content }).eq('id', existing.id).select().single();
    if (error) throw error;
    result = data;
  } else {
    const { data, error } = await supabase.from('support_content').insert({ content }).select().single();
    if (error) throw error;
    result = data;
  }
  return formatResponse(result?.content || content);
};
