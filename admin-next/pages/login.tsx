import { useMutation } from '@tanstack/react-query';
import React, { useEffect, useState } from 'react';
import { useForm } from 'react-hook-form';
import { useRouter } from 'next/router';
import Link from 'next/link';
import { login as loginApi } from '@/lib/supabaseApi';
import { useAuthContext } from '@/hooks/AuthContext';
import { useToast } from '@/hooks/ToastContext';

type LoginForm = {
  email: string;
  password: string;
  rememberMe: boolean;
};

const Login: React.FC = () => {
  const { register, handleSubmit, setValue, formState: { errors } } = useForm<LoginForm>();
  const [apiError, setApiError] = useState<string | null>(null);
  const [showPassword, setShowPassword] = useState(false);
  const router = useRouter();
  const auth = useAuthContext();
  const toast = useToast();

  useEffect(() => {
    const savedEmail = localStorage.getItem('admin_email');
    if (savedEmail) {
      setValue('email', savedEmail);
      setValue('rememberMe', true);
    }
  }, [setValue]);

  const mutation = useMutation({
    mutationFn: (data: LoginForm) => loginApi(data),
    onSuccess: (res: any, variables: LoginForm) => {
      setApiError(null);
      if (variables.rememberMe) {
        localStorage.setItem('admin_email', variables.email);
      } else {
        localStorage.removeItem('admin_email');
      }

      toast.showSuccess('Login successful! Redirecting...');
      router.push('/dashboard');
    },
    onError: (error: any) => {
      console.error('Login error:', error);
      let errorMessage = error?.response?.data?.message || error?.message || 'Login failed. Please check your credentials.';
      if (error?.code === 'email_not_confirmed' || errorMessage.includes('Email not confirmed')) {
        errorMessage = 'Admin account created, but email is not confirmed in Supabase. Please confirm the user in Supabase Authentication > Users or run SQL: UPDATE auth.users SET email_confirmed_at = NOW() WHERE email = \'murabusdatas@gmail.com\';';
      }
      setApiError(errorMessage);
      toast.showError(errorMessage);
    },
  });

  const onSubmit = (data: LoginForm) => {
    setApiError(null);
    mutation.mutate(data);
  };

  const handleAutoFill = () => {
    setValue('email', 'murabusdatas@gmail.com');
    setValue('password', 'Admin@123456');
    setApiError(null);
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100 py-12">
      <div className="w-full max-w-md px-6">
        {/* Navigation back to landing */}
        <div className="mb-4">
          <Link
            href="/"
            className="inline-flex items-center text-sm font-medium text-slate-500 hover:text-blue-900 transition-colors"
          >
            <svg className="w-4 h-4 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 19l-7-7m0 0l7-7m-7 7h18" />
            </svg>
            Back to Landing Page
          </Link>
        </div>

        {/* Logo/Brand Section */}
        <div className="text-center mb-6">
          <div className="inline-flex items-center justify-center w-16 h-16 bg-blue-900 rounded-2xl mb-4 shadow-lg">
            <svg className="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
            </svg>
          </div>
          <h1 className="text-3xl font-bold text-slate-800 mb-2">Welcome Back</h1>
          <p className="text-slate-500">Sign in to your admin account</p>
        </div>

        {/* Admin Login Details Hint Card */}
        <div className="mb-6 p-4 bg-blue-50 border border-blue-200 rounded-2xl shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <div className="flex items-center gap-1.5 text-blue-900 font-semibold text-xs uppercase tracking-wider">
              <svg className="w-4 h-4 text-blue-700" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clipRule="evenodd" />
              </svg>
              Admin Login Details
            </div>
            <button
              type="button"
              onClick={handleAutoFill}
              className="text-xs bg-blue-700 hover:bg-blue-800 text-white font-medium px-2.5 py-1 rounded-md shadow-sm transition-all"
            >
              Auto-Fill
            </button>
          </div>
          <div className="text-xs text-slate-700 space-y-1.5 font-mono">
            <div className="flex justify-between items-center bg-white/80 px-2.5 py-1.5 rounded-lg border border-blue-100">
              <span className="text-slate-500 font-sans">Email:</span>
              <span className="font-semibold text-blue-900 select-all">murabusdatas@gmail.com</span>
            </div>
            <div className="flex justify-between items-center bg-white/80 px-2.5 py-1.5 rounded-lg border border-blue-100">
              <span className="text-slate-500 font-sans">Password:</span>
              <span className="font-semibold text-blue-900 select-all">Admin@123456</span>
            </div>
          </div>
        </div>

        {/* Login Form Card */}
        <form
          onSubmit={handleSubmit(onSubmit)}
          className="bg-white rounded-2xl shadow-xl p-8 border border-slate-200"
        >
          {/* API Error Alert */}
          {apiError && (
            <div className="mb-6 p-4 bg-red-50 border border-red-200 rounded-lg">
              <div className="flex items-start">
                <svg className="w-5 h-5 text-red-600 mt-0.5 mr-3 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L10 8.586 8.707 7.293z" clipRule="evenodd" />
                </svg>
                <div>
                  <h3 className="text-sm font-semibold text-red-800">Login Failed</h3>
                  <p className="text-sm text-red-700 mt-1">{apiError}</p>
                </div>
              </div>
            </div>
          )}

          {/* Email Field */}
          <div className="mb-6">
            <label className="block text-sm font-semibold text-slate-700 mb-2">
              Email Address
            </label>
            <input
              type="email"
              {...register('email', {
                required: 'Email is required',
                pattern: {
                  value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                  message: 'Invalid email address'
                }
              })}
              className={`w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-900 focus:border-transparent transition-all ${
                errors.email ? 'border-red-400 bg-red-50' : 'border-slate-300 bg-slate-50'
              }`}
              placeholder="admin@example.com"
            />
            {errors.email && (
              <p className="text-red-500 text-sm mt-2 flex items-center">
                <svg className="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clipRule="evenodd" />
                </svg>
                {errors.email.message}
              </p>
            )}
          </div>

          {/* Password Field */}
          <div className="mb-6">
            <label className="block text-sm font-semibold text-slate-700 mb-2">
              Password
            </label>
            <div className="relative">
              <input
                type={showPassword ? 'text' : 'password'}
                {...register('password', {
                  required: 'Password is required',
                  minLength: {
                    value: 6,
                    message: 'Password must be at least 6 characters'
                  }
                })}
                className={`w-full px-4 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-900 focus:border-transparent transition-all ${
                  errors.password ? 'border-red-400 bg-red-50' : 'border-slate-300 bg-slate-50'
                }`}
                placeholder="••••••••"
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 focus:outline-none"
              >
                {showPassword ? (
                  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                  </svg>
                ) : (
                  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                )}
              </button>
            </div>
            {errors.password && (
              <p className="text-red-500 text-sm mt-2 flex items-center">
                <svg className="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                  <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clipRule="evenodd" />
                </svg>
                {errors.password.message}
              </p>
            )}
          </div>

          {/* Remember Me Only */}
          <div className="flex items-center justify-between mb-6">
            <label className="flex items-center cursor-pointer">
              <input
                type="checkbox"
                {...register('rememberMe')}
                className="w-4 h-4 text-blue-900 border-slate-300 rounded focus:ring-blue-900"
              />
              <span className="ml-2 text-sm text-slate-600">Remember me</span>
            </label>
          </div>

          {/* Submit Button */}
          <button
            type="submit"
            className="w-full bg-blue-900 text-white py-3 rounded-lg font-semibold hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-900 focus:ring-opacity-50 transition-all transform hover:scale-[1.02] active:scale-[0.98] disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none shadow-lg"
            disabled={mutation.status === 'pending'}
          >
            {mutation.status === 'pending' ? (
              <span className="flex items-center justify-center">
                <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" fill="none" viewBox="0 0 24 24">
                  <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                  <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                Signing in...
              </span>
            ) : (
              'Sign In'
            )}
          </button>
        </form>

        {/* Footer */}
        <p className="text-center text-sm text-slate-500 mt-6">
          Protected by enterprise-grade security &bull; Marabus Data Admin
        </p>
      </div>
    </div>
  );
};

export default Login;
