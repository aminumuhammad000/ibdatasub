import React, { createContext, useContext, useState, useEffect, type ReactNode } from 'react';
import { supabase } from '../lib/supabaseClient';
import { login as loginApi } from '../lib/supabaseApi';
import type { User, Session } from '@supabase/supabase-js';

interface AuthContextType {
  user: User | null;
  session: Session | null;
  admin: any;
  token: string | null;
  login: (email: string, password: string) => Promise<void>;
  logout: () => Promise<void>;
  loading: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [session, setSession] = useState<Session | null>(null);
  const [admin, setAdmin] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session?.user) {
        setSession(session);
        setUser(session.user);
        setAdmin(session.user);
      } else if (typeof window !== 'undefined') {
        const stored = localStorage.getItem('current_admin_user');
        if (stored) {
          try {
            const parsed = JSON.parse(stored);
            setUser(parsed);
            setAdmin(parsed);
          } catch (e) {
            console.error('Failed to parse stored admin user', e);
          }
        }
      }
      setLoading(false);
    });

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      if (session?.user) {
        setSession(session);
        setUser(session.user);
        setAdmin(session.user);
      }
    });

    return () => subscription.unsubscribe();
  }, []);

  const login = async (email: string, password: string) => {
    const res = await loginApi({ email, password });
    const loggedInUser = res?.user || res?.admin;
    if (!loggedInUser) {
      throw new Error('Invalid login credentials. Please check your email and password.');
    }
    setSession(res?.session || null);
    setUser(loggedInUser);
    setAdmin(loggedInUser);
  };

  const logout = async () => {
    try {
      await supabase.auth.signOut();
    } catch (e) {}
    localStorage.removeItem('current_admin_user');
    localStorage.removeItem('admin_token');
    setSession(null);
    setUser(null);
    setAdmin(null);
  };

  return (
    <AuthContext.Provider value={{
      user,
      session,
      admin: admin || user,
      token: session?.access_token ?? (typeof window !== 'undefined' ? localStorage.getItem('admin_token') : null),
      login,
      logout,
      loading,
    }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuthContext = () => {
  const context = useContext(AuthContext);
  if (!context) throw new Error('useAuthContext must be used within AuthProvider');
  return context;
};
