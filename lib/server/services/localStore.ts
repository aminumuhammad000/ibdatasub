import fs from 'fs';
import path from 'path';

export interface StoredUser {
  id: string;
  email: string;
  phone_number: string;
  password_hash: string;
  first_name: string;
  last_name: string;
  referral_code: string;
  referred_by?: string | null;
  transaction_pin?: string;
  country?: string;
  kyc_status?: string;
  status?: string;
  biometric_enabled?: boolean;
  avatar?: string;
  address?: string;
  city?: string;
  state?: string;
  created_at: string;
  updated_at: string;
}

export interface StoredWallet {
  id: string;
  user_id: string;
  balance: number;
  currency: string;
  created_at: string;
  updated_at: string;
  last_transaction_at?: string;
}

interface StoreData {
  users: StoredUser[];
  wallets: StoredWallet[];
  transactions: any[];
}

function resolveStorePath(): string {
  const isVercel = process.env.VERCEL || process.env.AWS_LAMBDA_FUNCTION_NAME;
  if (isVercel) {
    const tmpDir = path.join('/tmp', 'murabus_data');
    if (!fs.existsSync(tmpDir)) {
      try {
        fs.mkdirSync(tmpDir, { recursive: true });
      } catch {}
    }
    return path.join(tmpDir, 'store.json');
  }

  const dataDir = path.join(process.cwd(), 'data');
  if (!fs.existsSync(dataDir)) {
    try {
      fs.mkdirSync(dataDir, { recursive: true });
    } catch {
      return path.join('/tmp', 'murabus_store.json');
    }
  }
  return path.join(dataDir, 'store.json');
}

// Initial admin accounts so admin login works without external DB
const defaultUsers: StoredUser[] = [
  {
    id: '00000000-6913-80a2-e3ba-eb2c24cb7bbf',
    email: 'murabusdatas@gmail.com',
    phone_number: '08100015498',
    password_hash: '$2b$10$3F5FLQUL02r.shr2fWzZreaCm8MaePzwHimQYvvKMm8h489rTMx5e',
    first_name: 'IBRAHIM',
    last_name: 'MURABUS',
    referral_code: 'REF001',
    country: 'Nigeria',
    kyc_status: 'verified',
    status: 'active',
    created_at: '2025-11-11T18:29:54.442Z',
    updated_at: '2026-05-01T13:06:04.038Z',
  },
  {
    id: '00000000-6913-7b01-45f8-5a28e21733c6',
    email: 'admin@connectavtu.com',
    phone_number: '08000000001',
    password_hash: '$2b$10$xPvtmByvfRNQYLC.M.fPmufuGka78Glm4Mrslt3Mwo41Tna8LODXa',
    first_name: 'Super',
    last_name: 'Admin',
    referral_code: 'REF002',
    country: 'Nigeria',
    kyc_status: 'verified',
    status: 'active',
    created_at: '2025-11-11T18:05:53.982Z',
    updated_at: '2025-11-11T18:05:53.982Z',
  },
];

const defaultWallets: StoredWallet[] = [
  {
    id: 'wal_admin_1',
    user_id: '00000000-6913-80a2-e3ba-eb2c24cb7bbf',
    balance: 50000.0,
    currency: 'NGN',
    created_at: '2025-11-11T18:29:54.442Z',
    updated_at: '2026-05-01T13:06:04.038Z',
  },
];

class LocalStore {
  private filePath: string;
  private cache: StoreData | null = null;

  constructor() {
    this.filePath = resolveStorePath();
  }

  private load(): StoreData {
    if (this.cache) return this.cache;

    try {
      if (fs.existsSync(this.filePath)) {
        const raw = fs.readFileSync(this.filePath, 'utf-8');
        const data = JSON.parse(raw);
        this.cache = {
          users: Array.isArray(data.users) ? data.users : [...defaultUsers],
          wallets: Array.isArray(data.wallets) ? data.wallets : [...defaultWallets],
          transactions: Array.isArray(data.transactions) ? data.transactions : [],
        };
        return this.cache;
      }
    } catch (e) {
      console.warn('Failed to read local store file, initializing new:', e);
    }

    this.cache = {
      users: [...defaultUsers],
      wallets: [...defaultWallets],
      transactions: [],
    };
    this.save();
    return this.cache;
  }

  private save(): void {
    if (!this.cache) return;
    try {
      const dir = path.dirname(this.filePath);
      if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
      }
      fs.writeFileSync(this.filePath, JSON.stringify(this.cache, null, 2), 'utf-8');
    } catch (e) {
      console.warn('Failed to write to local store:', e);
    }
  }

  public findUser(
    criteria: { email?: string; phone_number?: string; id?: string } | ((u: StoredUser) => boolean)
  ): StoredUser | null {
    const data = this.load();
    if (typeof criteria === 'function') {
      return data.users.find(criteria) || null;
    }
    const cleanEmail = criteria.email ? criteria.email.toLowerCase().trim() : null;
    const cleanPhone = criteria.phone_number ? criteria.phone_number.trim() : null;
    const cleanId = criteria.id ? criteria.id.trim() : null;

    for (const u of data.users) {
      if (cleanEmail && u.email && u.email.toLowerCase().trim() === cleanEmail) {
        return u;
      }
      if (cleanPhone && u.phone_number && u.phone_number.trim() === cleanPhone) {
        return u;
      }
      if (cleanId && u.id && u.id.trim() === cleanId) {
        return u;
      }
    }

    return null;
  }

  public createUser(userPayload: StoredUser, walletPayload?: StoredWallet): { user: StoredUser; wallet: StoredWallet } {
    const data = this.load();
    const cleanEmail = userPayload.email.toLowerCase().trim();
    const cleanPhone = userPayload.phone_number ? userPayload.phone_number.trim() : '';

    // Guard against duplicates
    const duplicate = data.users.find((u) => {
      const uEmail = u.email ? u.email.toLowerCase().trim() : '';
      const uPhone = u.phone_number ? u.phone_number.trim() : '';
      return (cleanEmail && uEmail === cleanEmail) || (cleanPhone && cleanPhone.length > 5 && uPhone === cleanPhone);
    });

    if (duplicate) {
      throw new Error(
        duplicate.email.toLowerCase().trim() === cleanEmail
          ? 'An account with this email address already exists. Please log in.'
          : 'An account with this phone number already exists.'
      );
    }

    const newUser: StoredUser = {
      ...userPayload,
      email: cleanEmail,
      phone_number: cleanPhone || '08000000000',
      created_at: userPayload.created_at || new Date().toISOString(),
      updated_at: userPayload.updated_at || new Date().toISOString(),
    };

    const newWallet: StoredWallet = walletPayload || {
      id: `wal_${Date.now()}`,
      user_id: newUser.id,
      balance: 0.0,
      currency: 'NGN',
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    };

    data.users.push(newUser);
    data.wallets.push(newWallet);
    this.save();

    return { user: newUser, wallet: newWallet };
  }

  public getWallet(userId: string): StoredWallet {
    const data = this.load();
    let wallet = data.wallets.find((w) => w.user_id === userId);
    if (!wallet) {
      wallet = {
        id: `wal_${Date.now()}`,
        user_id: userId,
        balance: 0.0,
        currency: 'NGN',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      };
      data.wallets.push(wallet);
      this.save();
    }
    return wallet;
  }

  public updateWallet(userId: string, balance: number): StoredWallet {
    const data = this.load();
    let wallet = data.wallets.find((w) => w.user_id === userId);
    if (!wallet) {
      wallet = {
        id: `wal_${Date.now()}`,
        user_id: userId,
        balance,
        currency: 'NGN',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString(),
      };
      data.wallets.push(wallet);
    } else {
      wallet.balance = balance;
      wallet.updated_at = new Date().toISOString();
    }
    this.save();
    return wallet;
  }

  public updateUser(id: string, updates: Partial<StoredUser>): StoredUser | null {
    const data = this.load();
    const userIndex = data.users.findIndex((u) => u.id === id);
    if (userIndex === -1) return null;

    const current = data.users[userIndex];
    const updated = {
      ...current,
      ...updates,
      id: current.id, // prevent id change
      updated_at: new Date().toISOString(),
    };
    data.users[userIndex] = updated;
    this.save();
    return updated;
  }
}

export const localStore = new LocalStore();
