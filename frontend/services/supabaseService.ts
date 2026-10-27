import AsyncStorage from '@react-native-async-storage/async-storage';
import { supabase } from './supabase';

export interface SupabaseUserProfile {
  id: string;
  _id: string;
  email: string;
  phone_number?: string;
  first_name: string;
  last_name: string;
  referral_code?: string;
  kyc_status?: string;
  status?: string;
  wallet?: {
    balance: number;
    currency: string;
  };
}

export const supabaseAuthService = {
  /**
   * Register with Supabase
   */
  async register(data: {
    email: string;
    phone_number: string;
    password: string;
    first_name: string;
    last_name: string;
    referral_code?: string;
  }) {
    const { data: authData, error: authError } = await supabase.auth.signUp({
      email: data.email,
      password: data.password,
      options: {
        data: {
          first_name: data.first_name,
          last_name: data.last_name,
          phone_number: data.phone_number,
        },
      },
    });

    if (authError) throw authError;

    const userId = authData.user?.id;
    if (userId) {
      // Upsert user in public.users
      const { error: profileError } = await supabase.from('users').upsert({
        id: userId,
        email: data.email,
        phone_number: data.phone_number,
        first_name: data.first_name,
        last_name: data.last_name,
        referral_code: data.referral_code || `REF${Math.floor(100000 + Math.random() * 900000)}`,
        status: 'active',
        kyc_status: 'pending',
      });
      if (profileError) console.warn('Could not create public user record:', profileError.message);

      // Create wallet if not exists
      const { error: walletError } = await supabase.from('wallets').upsert({
        user_id: userId,
        balance: 0.00,
        currency: 'NGN',
      });
      if (walletError) console.warn('Could not initialize wallet:', walletError.message);
    }

    if (authData.session?.access_token) {
      await AsyncStorage.setItem('authToken', authData.session.access_token);
      await AsyncStorage.setItem('user', JSON.stringify({
        _id: userId,
        id: userId,
        email: data.email,
        phone_number: data.phone_number,
        first_name: data.first_name,
        last_name: data.last_name,
      }));
    }

    return {
      success: true,
      data: {
        user: {
          _id: userId,
          id: userId,
          email: data.email,
          phone_number: data.phone_number,
          first_name: data.first_name,
          last_name: data.last_name,
          status: 'active',
          kyc_status: 'pending',
        },
        token: authData.session?.access_token || '',
      },
      message: 'Account created successfully',
    };
  },

  /**
   * Log in with Supabase
   */
  async login(data: { email: string; password: string }) {
    const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
      email: data.email,
      password: data.password,
    });

    if (authError) throw authError;

    const userId = authData.user.id;

    // Fetch user details & wallet
    const [userRes, walletRes] = await Promise.all([
      supabase.from('users').select('*').eq('id', userId).maybeSingle(),
      supabase.from('wallets').select('*').eq('user_id', userId).maybeSingle(),
    ]);

    const userProfile = {
      _id: userId,
      id: userId,
      email: authData.user.email,
      first_name: userRes.data?.first_name || authData.user.user_metadata?.first_name || 'User',
      last_name: userRes.data?.last_name || authData.user.user_metadata?.last_name || '',
      phone_number: userRes.data?.phone_number || '',
      status: userRes.data?.status || 'active',
      kyc_status: userRes.data?.kyc_status || 'pending',
      wallet: walletRes.data || { balance: 0, currency: 'NGN' },
    };

    if (authData.session?.access_token) {
      await AsyncStorage.setItem('authToken', authData.session.access_token);
      await AsyncStorage.setItem('user', JSON.stringify(userProfile));
    }

    return {
      success: true,
      data: {
        user: userProfile,
        token: authData.session?.access_token || '',
      },
      message: 'Logged in successfully',
    };
  },

  /**
   * Log out
   */
  async logout() {
    await supabase.auth.signOut();
    await AsyncStorage.removeItem('authToken');
    await AsyncStorage.removeItem('user');
    return { success: true };
  },

  /**
   * Get current session
   */
  async getCurrentSession() {
    const { data } = await supabase.auth.getSession();
    return data.session;
  },
};

export const supabaseWalletService = {
  async getBalance(userId: string) {
    const { data, error } = await supabase.from('wallets').select('*').eq('user_id', userId).single();
    if (error) throw error;
    return {
      success: true,
      data: {
        balance: Number(data.balance || 0),
        currency: data.currency || 'NGN',
      },
    };
  },
};

export const supabaseTransactionService = {
  async getTransactions(userId: string, limit = 20) {
    const { data, error } = await supabase
      .from('transactions')
      .select('*')
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
      .limit(limit);

    if (error) throw error;

    return {
      success: true,
      data: (data || []).map((t: any) => ({
        ...t,
        _id: t.id,
      })),
    };
  },
};

export const supabasePlansService = {
  async getPlans(type?: 'AIRTIME' | 'DATA', providerId?: number) {
    let query = supabase.from('pricing_plans').select('*').eq('active', true).order('price', { ascending: true });
    if (type) query = query.eq('type', type);
    if (providerId) query = query.eq('provider_id', providerId);

    const { data, error } = await query;
    if (error) throw error;

    return {
      success: true,
      data: (data || []).map((p: any) => ({
        ...p,
        _id: p.id,
      })),
    };
  },
};

export const supabaseNotificationsService = {
  async getBroadcasts() {
    const { data, error } = await supabase.from('broadcasts').select('*').order('created_at', { ascending: false });
    if (error) throw error;
    return { success: true, data: data || [] };
  },

  async getUserNotifications(userId: string) {
    const { data, error } = await supabase
      .from('notifications')
      .select('*')
      .eq('user_id', userId)
      .order('created_at', { ascending: false });
    if (error) throw error;
    return { success: true, data: data || [] };
  },
};

export const supabaseAirtimeToCashService = {
  async getSettings() {
    const { data, error } = await supabase.from('airtime_to_cash_settings').select('*').eq('active', true);
    if (error) throw error;
    return { success: true, data: data || [] };
  },

  async submitRequest(userId: string, network: string, phoneNumber: string, amount: number, amountToReceive: number) {
    const { data, error } = await supabase.from('airtime_to_cash_requests').insert({
      user_id: userId,
      network,
      phone_number: phoneNumber,
      amount,
      amount_to_receive: amountToReceive,
      status: 'pending',
    }).select().single();

    if (error) throw error;
    return { success: true, data: { ...data, _id: data.id } };
  },
};
