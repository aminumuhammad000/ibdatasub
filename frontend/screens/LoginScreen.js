import { MaterialIcons } from '@expo/vector-icons';
import { useNavigation } from '@react-navigation/native';
import { useRouter } from 'expo-router';
import { useState, useEffect } from 'react';
import {
    ActivityIndicator,
    Alert,
    Image,
    KeyboardAvoidingView,
    Platform,
    ScrollView,
    StyleSheet,
    Text,
    TextInput,
    TouchableOpacity,
    View
} from 'react-native';
import { useAlert } from '../components/AlertContext';
import { useAuth } from '../context/AuthContext';

const LoginScreen = () => {
  const { showSuccess, showError } = useAlert();
  const { login, isLoading, isAuthenticated } = useAuth();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const navigation = useNavigation();
  const router = useRouter();

  // Redirect if already authenticated
  useEffect(() => {
    if (isAuthenticated) {
      router.replace('/(tabs)');
    }
  }, [isAuthenticated]);

  const handleLogin = async () => {
    // Validation
    if (!email || !password) {
      Alert.alert('❌ Validation Error', 'Please enter both email and password');
      return;
    }

    if (password.length < 6) {
      Alert.alert('❌ Validation Error', 'Password must be at least 6 characters');
      return;
    }
    
    try {
      console.log('🔐 Starting login process...');
      
      const response = await login({
        email: email.trim().toLowerCase(),
        password,
      });
      
      console.log('✅ Login successful:', response);
      
      if (response.success) {
        showSuccess('Login successful! Welcome back!');
        // Navigation is handled by the useEffect above
      } else {
        showError(response.message || 'Login failed. Please check your credentials.');
      }
    } catch (error) {
      console.error('❌ Login failed:', error);
      const errorMessage = error.message || 'Login failed. Please try again.';
      showError(errorMessage);
    } finally {
      // Loading state is managed by the AuthContext
    }
  };

  return (
    <KeyboardAvoidingView 
      style={styles.container}
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
    >
      <ScrollView 
        contentContainerStyle={styles.scrollContainer}
        keyboardShouldPersistTaps="handled"
      >
        <View style={styles.logoContainer}>
          <Image 
            source={{ uri: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCNmLt70vBl51N44lPp2_PhjggOAG8xKje7lYXmWc8X24jwhToxdayIVXORUOtpNLKUAckLXftXWI7ofIthz26meu2eTrKWvy6P5nHxlHRt8dTiEojOQYtZozWxl3HGOXPv3QlJO5NxLyS6bc5TZnW6A8cbhEj0M23nYWfDMEdtgGLqE-jv1F_9GaGc_gYRxq_gWYGl1aJCWaN-YpIfYxAkjigmOMsGiHgtUlWOLR3V2ynPCxJWg50VYJ_i179vEcrEekVRiL_O3oE' }} 
            style={styles.logo} 
          />
          <Text style={styles.title}>Welcome to Connecta</Text>
          <Text style={styles.subtitle}>Enter your email or phone number to get started.</Text>
        </View>

        <View style={styles.formContainer}>
          <View style={styles.inputContainer}>
            <Text style={styles.inputLabel}>Email or Phone Number</Text>
            <View style={styles.inputWrapper}>
              <TextInput
                style={styles.input}
                placeholder="Enter your email or phone number"
                placeholderTextColor="#9CA3AF"
                value={email}
                onChangeText={setEmail}
                keyboardType="email-address"
                autoCapitalize="none"
                autoCorrect={false}
                selectionColor="#3B82F6"
              />
            </View>
          </View>

          <View style={styles.inputContainer}>
            <Text style={styles.inputLabel}>Password</Text>
            <View style={styles.inputWrapper}>
              <TextInput
                style={styles.input}
                placeholder="Enter your password"
                placeholderTextColor="#9CA3AF"
                value={password}
                onChangeText={setPassword}
                secureTextEntry={!showPassword}
                selectionColor="#3B82F6"
              />
              <TouchableOpacity 
                style={styles.eyeIcon}
                onPress={() => setShowPassword(!showPassword)}
              >
                <MaterialIcons name={showPassword ? 'visibility-off' : 'visibility'} size={20} color="#9CA3AF" />
              </TouchableOpacity>
            </View>
          </View>

          <View style={styles.optionsRow}>
            <View style={{ flex: 1 }} />
            <TouchableOpacity>
              <Text style={styles.forgotPassword}>Forgot Password?</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.buttonContainer}>
            <TouchableOpacity 
              style={[styles.button, styles.primaryButton, isLoading && styles.buttonDisabled]}
              onPress={handleLogin}
              disabled={isLoading}
            >
              {isLoading ? (
                <ActivityIndicator color="#FFFFFF" />
              ) : (
                <Text style={styles.primaryButtonText}>Continue</Text>
              )}
            </TouchableOpacity>

            <TouchableOpacity style={[styles.button, styles.secondaryButton]}>
              <MaterialIcons name="fingerprint" size={24} color="#111921" />
              <Text style={styles.secondaryButtonText}>Sign in with Biometrics</Text>
            </TouchableOpacity>

            <View style={styles.dividerContainer}>
              <View style={styles.divider} />
              <Text style={styles.dividerText}>OR</Text>
              <View style={styles.divider} />
            </View>

          </View>

          <View style={styles.signupContainer}>
            <Text style={styles.signupText}>Don't have an account? </Text>
            <TouchableOpacity onPress={() => router.push('/signup')}>
              <Text style={styles.signupLink}>Sign Up</Text>
            </TouchableOpacity>
          </View>

          <Text style={styles.termsText}>
            By continuing, you agree to our{' '}
            <Text style={styles.linkText}>Terms of Service</Text> and{' '}
            <Text style={styles.linkText}>Privacy Policy</Text>.
          </Text>
        </View>
      </ScrollView>
    </KeyboardAvoidingView>
  );
};

export default LoginScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#111418',
  },
  scrollContainer: {
    flexGrow: 1,
    padding: 24,
  },
  logoContainer: {
    alignItems: 'center',
    marginTop: 40,
    marginBottom: 32,
  },
  logo: {
    width: 96,
    height: 96,
    borderRadius: 0,
    marginBottom: 24,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#F8FAFC',
    textAlign: 'center',
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 16,
    color: '#94A3B8',
    textAlign: 'center',
    marginBottom: 32,
  },
  formContainer: {
    width: '100%',
  },
  inputContainer: {
    marginBottom: 24,
  },
  inputLabel: {
    fontSize: 16,
    fontWeight: '500',
    color: '#E2E8F0',
    marginBottom: 8,
  },
  inputWrapper: {
    backgroundColor: '#1E293B',
    borderRadius: 12,
    borderWidth: 1,
    borderColor: '#334155',
    height: 56,
    justifyContent: 'center',
    paddingHorizontal: 16,
    flexDirection: 'row',
    alignItems: 'center',
  },
  input: {
    fontSize: 16,
    color: '#F8FAFC',
    padding: 0,
    margin: 0,
    height: '100%',
    flex: 1,
  },
  eyeIcon: {
    width: 24,
    height: 24,
    justifyContent: 'center',
    alignItems: 'center',
  },
  buttonContainer: {
    width: '100%',
    marginBottom: 24,
  },
  button: {
    width: '100%',
    height: 48,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
    flexDirection: 'row',
    marginBottom: 16,
  },
  primaryButton: {
    backgroundColor: '#0A2A4E',
  },
  primaryButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: 'bold',
  },
  secondaryButton: {
    backgroundColor: 'transparent',
    borderWidth: 1,
    borderColor: '#D1D5DB',
  },
  secondaryButtonText: {
    color: '#111921',
    fontSize: 16,
    fontWeight: 'bold',
    marginLeft: 8,
  },
  buttonDisabled: {
    opacity: 0.7,
  },
  optionsRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 24,
  },
  forgotPassword: {
    fontSize: 14,
    color: '#3B82F6',
    fontWeight: '500',
  },
  dividerContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginVertical: 20,
  },
  divider: {
    flex: 1,
    height: 1,
    backgroundColor: '#D1D5DB',
  },
  dividerText: {
    color: '#6B7280',
    fontSize: 14,
    marginHorizontal: 12,
  },
  socialButton: {
    backgroundColor: '#FFFFFF',
    borderWidth: 1,
    borderColor: '#D1D5DB',
  },
  socialIcon: {
    width: 24,
    height: 24,
    marginRight: 12,
  },
  socialButtonText: {
    fontSize: 16,
    fontWeight: '500',
  },
  signupContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    marginTop: 16,
    marginBottom: 8,
  },
  signupText: {
    fontSize: 14,
    color: '#6B7280',
  },
  signupLink: {
    fontSize: 14,
    color: '#3B82F6',
    fontWeight: '500',
  },
  termsText: {
    fontSize: 12,
    color: '#6B7280',
    textAlign: 'center',
    marginTop: 8,
  },
  linkText: {
    color: '#3B82F6',
    textDecorationLine: 'underline',
  },
  otpContent: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  otpTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#111921',
    marginBottom: 12,
    textAlign: 'center',
  },
  otpSubtitle: {
    fontSize: 16,
    color: '#6B7280',
    textAlign: 'center',
    marginBottom: 32,
    paddingHorizontal: 20,
  },
  otpInputsContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    width: '100%',
    marginBottom: 24,
  },
  otpInput: {
    width: 48,
    height: 56,
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    borderWidth: 1,
    borderColor: '#D1D5DB',
    textAlign: 'center',
    fontSize: 24,
    fontWeight: 'bold',
    color: '#111921',
  },
  resendText: {
    fontSize: 14,
    color: '#6B7280',
    textAlign: 'center',
  },
  resendLink: {
    color: '#3B82F6',
    fontWeight: '500',
  },
});
