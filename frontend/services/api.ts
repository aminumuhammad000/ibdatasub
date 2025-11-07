import AsyncStorage from '@react-native-async-storage/async-storage';
import axios, { AxiosRequestConfig, AxiosResponse } from 'axios';
import { Alert, Platform } from 'react-native';
import {
  AdminService,
  AdminUser,
  ApiResponse,
  AuditLog,
  BillPaymentResponse,
  DashboardStats,
  DataPlan,
  Network,
  PaginatedResponse,
  Transaction,
  User,
  Wallet
} from './types';

// API Configuration
const getApiUrl = () => {
  // Check for environment variable first
  const fromEnv = process.env.EXPO_PUBLIC_API_URL;
  if (fromEnv && typeof fromEnv === 'string') {
    const trimmed = fromEnv.replace(/\/$/, '');
    if (!/^https?:\/\//i.test(trimmed)) {
      console.warn('⚠️ EXPO_PUBLIC_API_URL is not a valid URL. Current:', trimmed);
    } else {
      console.log('🔧 Using environment API URL:', trimmed);
      return trimmed;
    }
  }

  // Development URLs
  if (__DEV__) {
    // For web
    if (Platform.OS === 'web') {
      const hostname = window.location.hostname;
      // Use the current hostname for web, which works for Expo web and local development
      const webUrl = `http://${hostname}:5000`;
      console.log('🌍 Using web API URL:', webUrl);
      return webUrl;
    }
    
    // For Android emulator
    if (Platform.OS === 'android') {
      console.log('🤖 Using Android emulator API URL');
      return 'http://10.0.2.2:5000';
    }
    
    // For iOS simulator and other platforms
    console.log('🍏 Using localhost API URL');
    return 'http://localhost:5000';
  }

  // Production URL - update this with your production URL
  console.log('🚀 Using production API URL');
  return 'https://your-production-api.com';
};

const API_BASE_URL = getApiUrl();

// Log the API URL being used
console.log('🌐 API Base URL:', API_BASE_URL);

// Create axios instance with better defaults
const api = axios.create({
  baseURL: API_BASE_URL,
  timeout: 30000,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
});

// Request interceptor for API calls
api.interceptors.request.use(
  async (config) => {
    const token = await AsyncStorage.getItem('authToken');
    const requestDetails = {
      url: config.url,
      method: config.method,
      baseURL: config.baseURL,
      headers: { ...config.headers },
      params: config.params,
      data: config.data,
      timeout: config.timeout,
      hasAuthHeader: !!config.headers?.Authorization,
      tokenPresent: !!token,
    };
    
    // Don't log sensitive data in production
    if (__DEV__) {
      console.log('🔵 API Request:', {
        method: requestDetails.method?.toUpperCase(),
        url: requestDetails.url,
        baseURL: requestDetails.baseURL,
        headers: Object.keys(requestDetails.headers),
        hasAuth: requestDetails.hasAuthHeader || requestDetails.tokenPresent,
        hasData: !!requestDetails.data,
        hasParams: !!requestDetails.params,
      });
    }

    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    
    console.log(`🚀 API Request: ${config.method?.toUpperCase()} ${config.url}`, {
      baseURL: config.baseURL,
      params: config.params,
      data: config.data,
      headers: config.headers
    });
    
    return config;
  },
  (error) => {
    console.error('❌ API Request Error:', error);
    return Promise.reject(error);
  }
);

// Response interceptor for error handling
api.interceptors.response.use(
  (response) => {
    // Log all responses in development, or only errors in production
    const shouldLog = __DEV__ || response.status >= 400;
    if (shouldLog) {
      console.log(`✅ API Response [${response.status}]: ${response.config.method?.toUpperCase()} ${response.config.url}`, {
        data: response.data,
      });
    }
    return response;
  },
  (error) => {
    // Enhanced error handling with user-friendly messages
    if (error.response) {
      // Server responded with a status code outside 2xx
      const { status, data } = error.response;
      let errorMessage = data?.message || 'An error occurred';

      // Handle specific status codes
      if (status === 401) {
        // Token expired or invalid
        AsyncStorage.multiRemove(['authToken', 'user']).catch(console.error);
        errorMessage = 'Your session has expired. Please log in again.';
        // Optional: Redirect to login screen
        // navigation.navigate('Login');
      } else if (status === 400 && data?.errors) {
        // Handle validation errors
        errorMessage = Object.values(data.errors).flat().join('\n');
      }

      // Log the error
      const errorDetails = {
        url: error.config?.url,
        method: error.config?.method,
        message: errorMessage,
        response: data,
      };
      
      console.error(`❌ API Error [${status}]:`, errorDetails);

      // Show user-friendly alert for non-401 errors
      if (status !== 401 && error.config?.url !== '/auth/check') {
        Alert.alert('Error', errorMessage);
      }

      return Promise.reject({
        message: errorMessage,
        status,
        data,
        isApiError: true,
        details: errorDetails,
      });
    } else if (error.request) {
      // Request was made but no response received
      const errorMessage = 'Unable to connect to the server. Please check your internet connection.';
      const errorDetails = {
        status: 0,
        message: errorMessage,
        url: error.config?.url,
        method: error.config?.method,
      };
      
      console.error('❌ API Network Error:', errorDetails);
      
      // Only show alert for non-background requests
      if (error.config?.url !== '/auth/check') {
        Alert.alert('Connection Error', errorMessage);
      }
      
      return Promise.reject({
        message: errorMessage,
        isNetworkError: true,
        originalError: error,
        details: errorDetails,
      });
    } else {
      // Something happened in setting up the request
      const errorMessage = 'An error occurred while processing your request.';
      const errorDetails = {
        message: error.message,
        stack: error.stack,
        config: error.config,
      };
      
      console.error('❌ Request Setup Error:', errorDetails);
      
      return Promise.reject({
        message: errorMessage,
        originalError: error,
        details: errorDetails,
      });
    }
  }
);

/**
 * API Service Modules
 * Organized by domain for better code organization
 */

// Authentication Service
const authService = {
  login: (credentials: { email: string; password: string }) => 
    api.post<ApiResponse<{ user: User; token: string }>>('/auth/login', credentials),
    
  register: (userData: {
    email: string;
    password: string;
    phone_number: string;
    first_name: string;
    last_name: string;
    referral_code?: string;
  }) => api.post<ApiResponse<{ user: User; token: string }>>('/auth/register', userData),
  
  verifyOtp: (otpData: { phone_number: string; otp_code: string }) => 
    api.post<ApiResponse>('/auth/verify-otp', otpData),
    
  resendOtp: (phoneData: { phone_number: string }) => 
    api.post<ApiResponse>('/auth/resend-otp', phoneData),
};

// User Service
const userService = {
  getProfile: () => api.get<ApiResponse<{ user: User }>>('/users/profile'),
  
  updateProfile: (userData: {
    first_name?: string;
    last_name?: string;
    phone_number?: string;
    date_of_birth?: string;
    address?: string;
    city?: string;
    state?: string;
    country?: string;
  }) => api.put<ApiResponse<{ user: User }>>('/users/profile', userData),
  
  deleteAccount: () => api.delete<ApiResponse>('/users/profile'),
  
  uploadKyc: (formData: FormData) => {
    const config: AxiosRequestConfig = {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    };
    return api.post<ApiResponse>('/users/kyc', formData, config);
  },
};

// Wallet Service
const walletService = {
  getWallet: () => api.get<ApiResponse<{ wallet: Wallet }>>('/wallet'),
  
  fundWallet: (fundData: { 
    amount: number; 
    paymentMethod: string; 
    reference: string;
  }) => api.post<ApiResponse<{ balance: number }>>('/wallet/fund', fundData),
  
  getTransactions: (params: { 
    page?: number; 
    limit?: number; 
    type?: string; 
    status?: string;
  } = {}) => api.get<ApiResponse<PaginatedResponse<Transaction>>>(
    '/wallet/transactions', 
    { params }
  ),
  
  transferFunds: (transferData: {
    recipientId: string;
    amount: number;
    note?: string;
  }) => api.post<ApiResponse>('/wallet/transfer', transferData),
  
  adjustBalance: (adjustmentData: {
    userId: string;
    amount: number;
    type: 'credit' | 'debit';
    reason: string;
  }) => api.put<ApiResponse>('/wallet/adjust', adjustmentData),
};

// Bill Payment Service
const billPaymentService = {
  // Network & Providers
  getNetworks: () => api.get<ApiResponse<Network[]>>('/billpayment/networks'),
  
  getCableProviders: () => api.get<ApiResponse<Array<{ id: string; name: string }>>>(
    '/billpayment/cable-providers'
  ),
  
  getElectricityProviders: () => api.get<ApiResponse<Array<{ id: string; name: string }>>>(
    '/billpayment/electricity-providers'
  ),
  
  getExamPinProviders: () => api.get<ApiResponse<Array<{ id: string; name: string }>>>(
    '/billpayment/exampin-providers'
  ),
  
  // Data Services
  getDataPlans: (network: string) => 
    api.get<ApiResponse<DataPlan[]>>('/billpayment/data-plans', { params: { network } }),
  
  // Airtime & Data
  buyAirtime: (data: { 
    network: string; 
    phone: string; 
    amount: number;
  }) => api.post<ApiResponse<BillPaymentResponse>>('/billpayment/airtime', data),
  
  buyData: (data: {
    network: string;
    phone: string;
    planId: string;
    amount: number;
  }) => api.post<ApiResponse<BillPaymentResponse>>('/billpayment/data', data),
  
  // Cable TV
  verifyCableAccount: (data: {
    provider: string;
    smartCardNumber: string;
  }) => api.post<ApiResponse<{ accountName: string; accountNumber: string }>>(
    '/billpayment/cable/verify', 
    data
  ),
  
  buyCableTv: (data: {
    provider: string;
    smartCardNumber: string;
    package: string;
    amount: number;
  }) => api.post<ApiResponse<BillPaymentResponse>>('/billpayment/cable/purchase', data),
  
  // Electricity
  verifyMeter: (data: {
    provider: string;
    meterNumber: string;
    meterType: 'prepaid' | 'postpaid';
  }) => api.post<ApiResponse<{ accountName: string; address: string }>>(
    '/billpayment/electricity/verify', 
    data
  ),
  
  buyElectricity: (data: {
    provider: string;
    meterNumber: string;
    meterType: 'prepaid' | 'postpaid';
    amount: number;
  }) => api.post<ApiResponse<BillPaymentResponse>>(
    '/billpayment/electricity/purchase', 
    data
  ),
  
  // Exam Pins
  buyExamPin: (data: {
    provider: string;
    quantity: number;
    examType: string;
  }) => api.post<ApiResponse<BillPaymentResponse>>('/billpayment/exampin', data),
  
  // Transaction Status
  getTransactionStatus: (reference: string) => 
    api.get<ApiResponse<{ transaction: Transaction }>>(
      `/billpayment/transaction/${reference}`
    ),
};

// Transaction Service
const transactionService = {
  getTransactions: (params: {
    page?: number;
    limit?: number;
    type?: string;
    status?: string;
  } = {}) => api.get<ApiResponse<PaginatedResponse<Transaction>>>(
    '/transactions', 
    { params }
  ),
  
  getTransaction: (id: string) => 
    api.get<ApiResponse<{ transaction: Transaction }>>(`/transactions/${id}`),
    
  updateStatus: (id: string, status: string) => 
    api.put<ApiResponse>(`/transactions/${id}/status`, { status }),
};

// Notification Service
const notificationService = {
  getNotifications: () => 
    api.get<ApiResponse<Array<{
      id: string;
      title: string;
      message: string;
      read: boolean;
      created_at: string;
    }>>>('/notifications'),
    
  getNotification: (id: string) => 
    api.get<ApiResponse<{
      id: string;
      title: string;
      message: string;
      read: boolean;
      created_at: string;
    }>>(`/notifications/${id}`),
    
  markAsRead: (id: string) => 
    api.put<ApiResponse>(`/notifications/${id}/read`),
    
  markAllAsRead: () => 
    api.put<ApiResponse>('/notifications/read-all'),
    
  deleteNotification: (id: string) => 
    api.delete<ApiResponse>(`/notifications/${id}`),
    
  deleteAllNotifications: () => 
    api.delete<ApiResponse>('/notifications'),
};

// Support Service
const supportService = {
  createTicket: (ticketData: {
    subject: string;
    message: string;
    category: string;
    priority: 'low' | 'medium' | 'high';
  }) => api.post<ApiResponse<{ 
    ticket: { 
      id: string; 
      ticketNumber: string; 
      status: string;
    } 
  }>>('/support', ticketData),
  
  getTickets: () => 
    api.get<ApiResponse<Array<{
      id: string;
      ticketNumber: string;
      subject: string;
      status: string;
      priority: string;
      created_at: string;
    }>>>('/support'),
    
  getTicket: (id: string) => 
    api.get<ApiResponse<{
      id: string;
      ticketNumber: string;
      subject: string;
      message: string;
      status: string;
      priority: string;
      category: string;
      created_at: string;
      updated_at: string;
      messages?: Array<{
        id: string;
        message: string;
        sender: 'user' | 'support';
        created_at: string;
      }>;
    }>>(`/support/${id}`),
    
  updateTicket: (id: string, updateData: { message: string }) => 
    api.put<ApiResponse>(`/support/${id}`, updateData),
    
  updateTicketStatus: (id: string, status: string) => 
    api.put<ApiResponse>(`/support/${id}/status`, { status }),
    
  deleteTicket: (id: string) => 
    api.delete<ApiResponse>(`/support/${id}`),
};

// Promotion Service
const promotionService = {
  getPromotions: () => 
    api.get<ApiResponse<Array<{
      id: string;
      title: string;
      description: string;
      code: string;
      discount: number;
      validFrom: string;
      validTo: string;
      isActive: boolean;
    }>>>('/promotions'),
    
  getPromotion: (id: string) => 
    api.get<ApiResponse<{
      id: string;
      title: string;
      description: string;
      code: string;
      discount: number;
      validFrom: string;
      validTo: string;
      isActive: boolean;
      created_at: string;
      updated_at: string;
    }>>(`/promotions/${id}`),
    
  createPromotion: (promoData: {
    title: string;
    description: string;
    code: string;
    discount: number;
    validFrom: string;
    validTo: string;
  }) => api.post<ApiResponse>('/promotions', promoData),
  
  updatePromotion: (id: string, promoData: {
    title?: string;
    description?: string;
    code?: string;
    discount?: number;
    validFrom?: string;
    validTo?: string;
    isActive?: boolean;
  }) => api.put<ApiResponse>(`/promotions/${id}`, promoData),
  
  deletePromotion: (id: string) => 
    api.delete<ApiResponse>(`/promotions/${id}`)
};

// Admin Service implementation
const adminService: AdminService = {
  // Auth
  adminLogin(credentials: { email: string; password: string }) {
    return api.post<ApiResponse<{ 
      token: string;
      admin: {
        id?: string;
        _id?: string;
        email: string;
        role?: string;
        status?: 'active' | 'inactive' | 'suspended';
        [key: string]: any;
      };
    }>>('/admin/login', credentials).then(response => {
      // Map the response to match AdminUser type
      if (response.data.data) {
        const { admin, token } = response.data.data;
        const mappedAdmin: AdminUser = {
          _id: admin.id || admin._id || '',
          role: admin.role || 'admin',
          status: admin.status || 'active',
          // Add any other fields that might be present
          ...admin
        };
        
        // Update the response with the properly typed admin object
        response.data.data = {
          token,
          admin: mappedAdmin
        };
      }
      return response as unknown as AxiosResponse<ApiResponse<{ token: string; admin: AdminUser }>>;
    });
  },
  
  // Dashboard
  getDashboardStats() {
    return api.get<ApiResponse<DashboardStats>>('/admin/dashboard');
  },
  
  // Users
  getUsers(params: { 
    page?: number; 
    limit?: number; 
    search?: string; 
    status?: string;
  } = {}) {
    return api.get<ApiResponse<PaginatedResponse<AdminUser>>>('/admin/users', { params });
  },
  
  getUser(id: string): Promise<AxiosResponse<ApiResponse<{ user: AdminUser }>>> {
    return api.get<ApiResponse<{ user: AdminUser }>>(`/admin/users/${id}`);
  },
    
  updateUser(id: string, userData: Partial<User>) {
    return api.put<ApiResponse<{ user: User }>>(`/admin/users/${id}`, userData);
  },
    
  updateUserStatus(id: string, status: 'active' | 'inactive' | 'suspended') {
    return api.put<ApiResponse>(`/admin/users/${id}/status`, { status });
  },
    
  deleteUser(id: string) {
    return api.delete<ApiResponse>(`/admin/users/${id}`);
  },
    
  // Audit Logs
  getAuditLogs(params = {}) {
    return api.get<ApiResponse<PaginatedResponse<AuditLog>>>('/admin/audit-logs', { params });
  },
    
  deleteAuditLog(id: string) {
    return api.delete<ApiResponse<void>>(`/admin/audit-logs/${id}`);
  }
};

// Export all services
export {
  adminService, authService, billPaymentService, api as default, notificationService, promotionService, supportService, transactionService, userService,
  walletService
};

