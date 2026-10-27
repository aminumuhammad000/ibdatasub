import { useEffect } from 'react';
import { useRouter } from 'next/router';
import { useAuthContext } from '@/hooks/AuthContext';
import Login from './login';

export default function AdminPage() {
  const { user, loading } = useAuthContext();
  const router = useRouter();

  useEffect(() => {
    if (!loading && user) {
      router.replace('/dashboard');
    }
  }, [user, loading, router]);

  return <Login />;
}
