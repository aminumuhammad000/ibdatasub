import React, { createContext, useState, useEffect, useContext } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { authService } from '../services/auth.service';

export const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [isAuthenticated, setIsAuthenticated] = useState(false);

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
    try {
      if (!userData?.email || !userData?.password) {
        throw new Error('Email and password are required');
      }
      
      const response = await authService.login(userData);
      
      if (!response?.success || !response.data?.user) {
        throw new Error(response?.message || 'Invalid login response');
      }
      
      // Verify we have a valid token after login
      const token = await AsyncStorage.getItem('authToken');
      if (!token) {
        throw new Error('Authentication failed: No token received');
      }
      
      setUser(response.data.user);
      setIsAuthenticated(true);
      return { success: true };
    } catch (error) {
      console.error('Login error:', error);
      // Ensure we're logged out if login fails
      await authService.logout();
      setUser(null);
      setIsAuthenticated(false);
      return { 
        success: false, 
        message: error.message || 'Login failed. Please check your credentials.' 
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
