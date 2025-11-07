import AsyncStorage from '@react-native-async-storage/async-storage';
import axios from 'axios';
import React, { createContext, useContext, useEffect, useState } from 'react';
import { authService } from '../services/auth.service';

export const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  
  // Test API connection
  const testConnection = async () => {
    try {
      console.log('🔌 Testing connection to API...');
      const response = await axios.get('https://jsonplaceholder.typicode.com/posts/1');
      console.log('✅ Connection test successful:', response.status, response.statusText);
      return { success: true, data: response.data };
    } catch (error) {
      console.error('❌ Connection test failed:', error.message);
      return { 
        success: false, 
        message: error.message,
        details: error.response?.data || 'No response data'
      };
    }
  };

  // Check if user is logged in on app start
  useEffect(() => {
    const checkAuth = async () => {
      try {
        const token = await AsyncStorage.getItem('authToken');
        if (!token) {
          throw new Error('No authentication token found');
        }
        
        const userData = await authService.getCurrentUser();
        if (!userData) {
          throw new Error('Invalid user data');
        }
        
        setUser(userData);
        setIsAuthenticated(true);
      } catch (error) {
        console.log('Auth check failed, forcing logout:', error.message);
        // Clear any invalid auth state
        await authService.logout();
        setUser(null);
        setIsAuthenticated(false);
      } finally {
        setIsLoading(false);
      }
    };

    checkAuth();
  }, []);

  const login = async (userData) => {
    setIsLoading(true);
    try {
      console.log('🔐 Starting login process...');
      
      if (!userData?.email || !userData?.password) {
        console.log('❌ Login failed: Missing email or password');
        throw new Error('Email and password are required');
      }
      
      console.log('🔑 Attempting login with:', { email: userData.email });
      const response = await authService.login(userData);
      
      // Check for network errors first
      if (!response) {
        console.error('❌ No response from server');
        throw new Error('Unable to connect to the server. Please check your internet connection.');
      }
      
      console.log('📡 Login response:', response);
      
      // Check for failed login
      if (!response.success) {
        console.log('❌ Login failed:', response.message || 'No error message provided');
        throw new Error(response.message || 'Invalid email or password');
      }
      
      // Verify we have a valid user and token
      if (!response.data?.user) {
        console.error('❌ Invalid user data in response:', response);
        throw new Error('Invalid user data received');
      }
      
      const token = await AsyncStorage.getItem('authToken');
      if (!token) {
        console.error('❌ No auth token found in storage');
        throw new Error('Authentication failed: No token received');
      }
      
      console.log('✅ Login successful, user:', response.data.user.email);
      setUser(response.data.user);
      setIsAuthenticated(true);
      return { success: true };
      
    } catch (error) {
      console.error('❌ Login error:', {
        message: error.message,
        name: error.name,
        stack: error.stack,
        response: error.response?.data || 'No response data'
      });
      
      // Clear any partial auth state
      try {
        await authService.logout();
      } catch (logoutError) {
        console.error('Error during logout after failed login:', logoutError);
      }
      
      setUser(null);
      setIsAuthenticated(false);
      
      // Provide more user-friendly error messages
      let errorMessage = error.message || 'Login failed. Please try again.';
      
      // Handle network errors specifically
      const errorMessageLower = (error.message || '').toLowerCase();
      if (errorMessageLower.includes('network error') || 
          errorMessageLower.includes('timeout') ||
          errorMessageLower.includes('no response received') ||
          errorMessageLower.includes('failed to fetch')) {
        errorMessage = 'Unable to connect to the server. Please check your internet connection and try again.';
      }
      
      return { 
        success: false, 
        message: errorMessage,
        error: process.env.NODE_ENV === 'development' ? {
          originalError: error.message,
          stack: error.stack
        } : undefined
      };
    }
  };

  const logout = async () => {
    try {
      await authService.logout();
      setUser(null);
      setIsAuthenticated(false);
      return { success: true };
    } catch (error) {
      console.error('Logout error:', error);
      return { success: false, message: error.message || 'Logout failed' };
    }
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        isAuthenticated,
        isLoading,
        testConnection,
        login,
        logout,
      }}
    >
      {!isLoading && children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
};
