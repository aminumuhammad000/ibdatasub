import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://ktjqbsoyuukmpvehcdkp.supabase.co';
const supabaseAnonKey =
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ||
  process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY ||
  'sb_publishable_ceITR7XipG_dBI7KnBAnZA_RrVBYtjp';

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
