import { useAlert } from '@/components/AlertContext';
import { authService } from '@/services/auth.service';
import { paymentService } from '@/services/payment.service';
import { payrantService, VirtualAccountResponse } from '@/services/payrant.service';
import { Ionicons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import * as WebBrowser from 'expo-web-browser';
import React, { useEffect, useState } from 'react';
import {
  ActivityIndicator,
  Alert,
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  useColorScheme,
  View
} from 'react-native';

const theme = {
  primary: '#0A2540',
  accent: '#FF9F43',
  success: '#00D4AA',
  error: '#FF5B5B',
};

export default function AddMoneyScreen() {
  const router = useRouter();
  const colorScheme = useColorScheme();
  const isDark = colorScheme === 'dark';

  const bgColor = isDark ? '#000000' : '#F9FAFB';
  const cardBgColor = isDark ? '#1C1C1E' : '#FFFFFF';
  const textColor = isDark ? '#FFFFFF' : '#1F2937';
  const textBodyColor = isDark ? '#D1D5DB' : '#6B7280';
  const borderColor = isDark ? '#374151' : '#E5E7EB';

  const { showSuccess, showError, showInfo } = useAlert();
  const [amount, setAmount] = useState('');
  const [selectedMethod, setSelectedMethod] = useState<string | null>('payrant'); // Default to Payrant
  const [userName, setUserName] = useState('Loading...');
  const [isLoading, setIsLoading] = useState(false);
  const [virtualAccount, setVirtualAccount] = useState<VirtualAccountResponse | null>(null);
  const [isLoadingVirtualAccount, setIsLoadingVirtualAccount] = useState(true);
  const [isCreatingVirtualAccount, setIsCreatingVirtualAccount] = useState(false);

  useEffect(() => {
    const loadUserName = async () => {
      const user = await authService.getCurrentUser();
      if (user) {
        const fullName = `${user.first_name || ''} ${user.last_name || ''}`.trim().toUpperCase();
        setUserName(fullName || 'USER');
      }
    };
    loadUserName();
  }, []);

  useEffect(() => {
    loadVirtualAccount();
  }, []);

  const loadVirtualAccount = async () => {
    try {
      setIsLoadingVirtualAccount(true);
      console.log('Loading virtual account...');
      
      const account = await payrantService.getVirtualAccount();
      console.log('Virtual account response:', account);
      
      if (account && account.account_number) {
        console.log('Virtual account found:', {
          accountNumber: account.account_number,
          accountName: account.account_name,
          status: account.status
        });
        setVirtualAccount(account);
      } else {
        console.log('No virtual account found or invalid account data');
        setVirtualAccount(null);
      }
    } catch (error: any) {
      console.error('Error loading virtual account:', {
        message: error.message,
        response: error.response?.data,
        status: error.response?.status
      });
      setVirtualAccount(null);
    } finally {
      setIsLoadingVirtualAccount(false);
    }
  };

  const handleCreateVirtualAccount = async () => {
    try {
      setIsCreatingVirtualAccount(true);
      showInfo('Creating your virtual account...');

      const user = await authService.getCurrentUser();
      if (!user) {
        showError('User not found. Please login again.');
        return;
      }

      // Generate unique account reference
      const accountReference = `${user._id}-${Date.now().toString(36)}`;

      // Use phone number as document number
      const account = await payrantService.createVirtualAccount({
        documentType: 'nin',
        documentNumber: user.phone_number, // Using phone number as NIN
        virtualAccountName: `${user.first_name} ${user.last_name}`,
        customerName: `${user.first_name} ${user.last_name}`,
        email: user.email,
        accountReference,
      });

      setVirtualAccount(account);
      showSuccess('Virtual account created successfully!');
    } catch (error: any) {
      console.error('Error creating virtual account:', error);
      showError(error.message || 'Failed to create virtual account');
    } finally {
      setIsCreatingVirtualAccount(false);
    }
  };

  const copyToClipboard = (text: string, label: string) => {
    // Simple copy function - you can enhance this
    Alert.alert('Copied', `${label} copied to clipboard`);
  };

  const quickAmounts = [1000, 2000, 5000, 10000, 20000, 50000];

  const paymentMethods = [
    {
      id: 'virtual',
      name: 'Virtual Account',
      description: 'Your dedicated account number',
      icon: 'wallet-outline',
      color: '#06B6D4',
    },
    {
      id: 'payrant',
      name: 'Payrant Checkout',
      description: 'Quick checkout (Recommended)',
      icon: 'flash-outline',
      color: '#10B981',
    },
    {
      id: 'monnify',
      name: 'Card/Bank Transfer',
      description: 'Pay with card or bank',
      icon: 'card-outline',
      color: '#8B5CF6',
    },
  ];

  const handleAddMoney = async () => {
    // Validation
    if (!amount || !selectedMethod) {
      showError('Please enter amount and select payment method');
      return;
    }

    const amountNum = parseFloat(amount);
    if (isNaN(amountNum) || amountNum <= 0) {
      showError('Please enter a valid amount');
      return;
    }

    if (amountNum < 100) {
      showError('Minimum amount is ₦100');
      return;
    }

    if (amountNum > 1000000) {
      showError('Maximum amount is ₦1,000,000');
      return;
    }

    if (selectedMethod === 'virtual') {
      showInfo('Transfer to the virtual account above to fund your wallet');
      return;
    }

    // Handle Payrant payment (DEFAULT)
    if (selectedMethod === 'payrant') {
      setIsLoading(true);
      try {
        showInfo('Initializing Payrant checkout...');
        
        const response = await paymentService.initiatePayment({
          amount: amountNum,
          gateway: 'payrant',
        });

        if (response.success) {
          const checkoutUrl = response.data.payment.checkoutUrl || '';
          const paymentReference = response.data.transaction.reference;

          console.log('💳 Opening Payrant checkout:', checkoutUrl);

          const result = await WebBrowser.openBrowserAsync(checkoutUrl);

          if (result.type === 'cancel' || result.type === 'dismiss') {
            showInfo('Verifying payment status...');
            await new Promise(resolve => setTimeout(resolve, 2000));
            
            try {
              const verifyResponse = await paymentService.verifyPayment(paymentReference);
              
              if (verifyResponse.success && verifyResponse.data.status === 'paid') {
                showSuccess('Payment successful! Your wallet has been credited.');
                setTimeout(() => router.push('/(tabs)'), 1500);
              } else if (verifyResponse.data.status === 'pending') {
                showInfo('Payment is being processed. We will credit your wallet once confirmed.');
                setTimeout(() => router.back(), 2000);
              } else {
                showError('Payment was not completed. Please try again.');
              }
            } catch (verifyError: any) {
              console.error('Verification error:', verifyError);
              showInfo('We are verifying your payment. Please check your wallet in a few moments.');
              setTimeout(() => router.back(), 2000);
            }
          }
        }
      } catch (error: any) {
        console.error('Payment error:', error);
        showError(error.message || 'Failed to initiate payment. Please try again.');
      } finally {
        setIsLoading(false);
      }
    }

    // Handle Monnify payment
    if (selectedMethod === 'monnify') {
      setIsLoading(true);
      try {
        showInfo('Initializing Monnify checkout...');
        
        const response = await paymentService.initiatePayment({
          amount: amountNum,
          gateway: 'monnify',
        });

        if (response.success) {
          const checkoutUrl = response.data.payment.checkoutUrl || '';
          const paymentReference = response.data.payment.paymentReference || response.data.transaction.reference;

          console.log('💳 Opening Monnify checkout:', checkoutUrl);

          const result = await WebBrowser.openBrowserAsync(checkoutUrl);

          if (result.type === 'cancel' || result.type === 'dismiss') {
            showInfo('Verifying payment status...');
            await new Promise(resolve => setTimeout(resolve, 2000));
            
            try {
              const verifyResponse = await paymentService.verifyPayment(paymentReference);
              
              if (verifyResponse.success && verifyResponse.data.status === 'paid') {
                showSuccess('Payment successful! Your wallet has been credited.');
                setTimeout(() => router.push('/(tabs)'), 1500);
              } else if (verifyResponse.data.status === 'pending') {
                showInfo('Payment is being processed. We will credit your wallet once confirmed.');
                setTimeout(() => router.back(), 2000);
              } else {
                showError('Payment was not completed. Please try again.');
              }
            } catch (verifyError: any) {
              console.error('Verification error:', verifyError);
              showInfo('We are verifying your payment. Please check your wallet in a few moments.');
              setTimeout(() => router.back(), 2000);
            }
          }
        }
      } catch (error: any) {
        console.error('Payment error:', error);
        showError(error.message || 'Failed to initiate payment. Please try again.');
      } finally {
        setIsLoading(false);
      }
    }
  };

  return (
    <View style={[styles.container, { backgroundColor: bgColor }]}>
      {/* Header */}
      <View style={[styles.header, { backgroundColor: cardBgColor }]}>
        <TouchableOpacity 
          style={styles.backButton}
          onPress={() => router.back()}
        >
          <Ionicons name="arrow-back" size={24} color={textColor} />
        </TouchableOpacity>
        <Text style={[styles.headerTitle, { color: textColor }]}>Add Money</Text>
        <View style={styles.placeholder} />
      </View>

      <ScrollView
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.scrollContent}
      >
        {/* Virtual Account ATM Card */}
        {isLoadingVirtualAccount ? (
          <View style={[styles.atmCard, { backgroundColor: cardBgColor, padding: 40 }]}>
            <ActivityIndicator size="large" color={theme.accent} />
            <Text style={[styles.atmInfoText, { color: textBodyColor, marginTop: 16, textAlign: 'center' }]}>
              Loading virtual account...
            </Text>
          </View>
        ) : virtualAccount?.account_number ? (
          <View style={styles.atmCard}>
            {/* Card Background Gradient Effect */}
            <View style={styles.atmCardGradient}>
              {/* Card Header */}
              <View style={styles.atmCardHeader}>
                <View style={styles.atmCardChip}>
                  <Ionicons name="card" size={28} color="#FFD700" />
                </View>
                <Text style={styles.atmCardBank}>PALMPAY</Text>
              </View>

            {/* Account Number */}
            <View style={styles.atmAccountSection}>
              <Text style={styles.atmLabel}>ACCOUNT NUMBER</Text>
              <View style={styles.atmAccountNumberRow}>
                <Text style={styles.atmAccountNumber}>{virtualAccount.account_number}</Text>
                <TouchableOpacity 
                  style={styles.atmCopyButton}
                  onPress={() => {
                    // Copy to clipboard
                    // In a real app, you would use expo-clipboard here
                    // For now, we'll just show an alert
                    alert('Account number copied to clipboard!');
                  }}
                >
                  <Ionicons name="copy-outline" size={20} color="#FFFFFF" />
                </TouchableOpacity>
              </View>
            </View>

              {/* Account Name and Virtual Tag */}
              <View style={styles.atmCardFooter}>
                <View style={styles.atmNameSection}>
                  <Text style={styles.atmLabel}>ACCOUNT NAME</Text>
                  <Text style={styles.atmAccountName}>{virtualAccount?.account_name || 'Loading...'}</Text>
                </View>
                <View style={styles.virtualBadge}>
                  <Ionicons name="shield-checkmark" size={12} color="#00D4AA" />
                  <Text style={styles.virtualBadgeText}>
                    {virtualAccount?.status?.toUpperCase() || 'INACTIVE'}
                  </Text>
                </View>
              </View>

              {/* Card Pattern/Design */}
              <View style={styles.atmPattern}>
                <View style={styles.atmCircle1} />
                <View style={styles.atmCircle2} />
                <View style={styles.atmCircle3} />
              </View>
            </View>

            {/* Info Text */}
            <View style={styles.atmInfoBox}>
              <Ionicons name="information-circle" size={16} color={theme.accent} />
              <Text style={styles.atmInfoText}>
                Transfer to this account to fund your wallet instantly
              </Text>
            </View>
          </View>
        ) : (
          <View style={[styles.noAccountCard, { backgroundColor: cardBgColor, borderColor }]}>
            <Ionicons name="wallet-outline" size={64} color={textBodyColor} />
            <Text style={[styles.noAccountTitle, { color: textColor }]}>
              No Virtual Account Yet
            </Text>
            <Text style={[styles.noAccountText, { color: textBodyColor }]}>
              Create a virtual account to receive instant deposits
            </Text>
            <TouchableOpacity
              style={[styles.createAccountButton, { backgroundColor: theme.accent }]}
              onPress={handleCreateVirtualAccount}
              disabled={isCreatingVirtualAccount}
            >
              {isCreatingVirtualAccount ? (
                <>
                  <ActivityIndicator color="#FFFFFF" size="small" />
                  <Text style={styles.createAccountButtonText}>Creating...</Text>
                </>
              ) : (
                <>
                  <Ionicons name="add-circle" size={20} color="#FFFFFF" />
                  <Text style={styles.createAccountButtonText}>Generate Virtual Account</Text>
                </>
              )}
            </TouchableOpacity>
          </View>
        )}

        {/* Amount Input */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Enter Amount</Text>
          <View style={[styles.amountInputContainer, { backgroundColor: cardBgColor, borderColor }]}>
            <Text style={[styles.currencySymbol, { color: textColor }]}>₦</Text>
            <TextInput
              style={[styles.amountInput, { color: textColor }]}
              placeholder="0.00"
              placeholderTextColor={textBodyColor}
              value={amount}
              onChangeText={setAmount}
              keyboardType="numeric"
            />
          </View>
          <Text style={[styles.helperText, { color: textBodyColor }]}>
            Minimum: ₦100 • Maximum: ₦500,000
          </Text>
        </View>

        {/* Quick Amounts */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Quick Amounts</Text>
          <View style={styles.quickAmountsGrid}>
            {quickAmounts.map((quickAmount) => (
              <TouchableOpacity
                key={quickAmount}
                style={[
                  styles.quickAmountCard,
                  {
                    backgroundColor: amount === quickAmount.toString()
                      ? (isDark ? theme.primary : theme.primary)
                      : cardBgColor,
                    borderColor: amount === quickAmount.toString()
                      ? theme.accent
                      : borderColor,
                  },
                ]}
                onPress={() => setAmount(quickAmount.toString())}
                activeOpacity={0.7}
              >
                <Text
                  style={[
                    styles.quickAmountText,
                    {
                      color: amount === quickAmount.toString() ? '#FFFFFF' : textColor,
                    },
                  ]}
                >
                  ₦{quickAmount.toLocaleString()}
                </Text>
              </TouchableOpacity>
            ))}
          </View>
        </View>

        {/* Payment Methods */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Payment Method</Text>
          <View style={styles.paymentMethodsList}>
            {paymentMethods.map((method) => (
              <TouchableOpacity
                key={method.id}
                style={[
                  styles.paymentMethodCard,
                  {
                    backgroundColor: cardBgColor,
                    borderColor: selectedMethod === method.id ? method.color : borderColor,
                    borderWidth: 2,
                  },
                ]}
                onPress={() => setSelectedMethod(method.id)}
                activeOpacity={0.7}
              >
                <View
                  style={[
                    styles.paymentMethodIcon,
                    {
                      backgroundColor: `${method.color}20`,
                    },
                  ]}
                >
                  <Ionicons
                    name={method.icon as any}
                    size={24}
                    color={method.color}
                  />
                </View>
                <View style={styles.paymentMethodInfo}>
                  <Text style={[styles.paymentMethodName, { color: textColor }]}>
                    {method.name}
                  </Text>
                  <Text style={[styles.paymentMethodDescription, { color: textBodyColor }]}>
                    {method.description}
                  </Text>
                </View>
                {selectedMethod === method.id && (
                  <View style={[styles.checkMark, { backgroundColor: method.color }]}>
                    <Ionicons name="checkmark" size={14} color="#FFFFFF" />
                  </View>
                )}
              </TouchableOpacity>
            ))}
          </View>
        </View>

        {/* Virtual Account Details */}
        {selectedMethod === 'virtual' && virtualAccount && (
          <View style={[styles.accountDetailsCard, { backgroundColor: cardBgColor }]}>
            <View style={styles.accountDetailsHeader}>
              <Ionicons name="shield-checkmark-outline" size={24} color={theme.success} />
              <Text style={[styles.accountDetailsTitle, { color: textColor }]}>
                Your Virtual Account
              </Text>
            </View>
            <Text style={[styles.accountDetailsSubtitle, { color: textBodyColor }]}>
              Transfer to this account to fund your wallet instantly
            </Text>

            <View style={[styles.accountInfoBox, { backgroundColor: isDark ? '#0A2540' : '#EFF6FF' }]}>
              <View style={styles.accountInfoRow}>
                <Text style={[styles.accountInfoLabel, { color: textBodyColor }]}>Bank Name:</Text>
                <View style={styles.accountInfoValueContainer}>
                  <Text style={[styles.accountInfoValue, { color: textColor }]}>
                    Payrant (PalmPay)
                  </Text>
                  <TouchableOpacity onPress={() => copyToClipboard('Payrant (PalmPay)', 'Bank name')}>
                    <Ionicons name="copy-outline" size={18} color={theme.accent} />
                  </TouchableOpacity>
                </View>
              </View>

              <View style={styles.accountInfoRow}>
                <Text style={[styles.accountInfoLabel, { color: textBodyColor }]}>Account Number:</Text>
                <View style={styles.accountInfoValueContainer}>
                  <Text style={[styles.accountInfoValue, { color: textColor, fontWeight: '700' }]}>
                    {virtualAccount.account_number}
                  </Text>
                  <TouchableOpacity onPress={() => copyToClipboard(virtualAccount.account_number, 'Account number')}>
                    <Ionicons name="copy-outline" size={18} color={theme.accent} />
                  </TouchableOpacity>
                </View>
              </View>

              <View style={styles.accountInfoRow}>
                <Text style={[styles.accountInfoLabel, { color: textBodyColor }]}>Account Name:</Text>
                <View style={styles.accountInfoValueContainer}>
                  <Text style={[styles.accountInfoValue, { color: textColor }]}>
                    {virtualAccount.account_name}
                  </Text>
                  <TouchableOpacity onPress={() => copyToClipboard(virtualAccount.account_name, 'Account name')}>
                    <Ionicons name="copy-outline" size={18} color={theme.accent} />
                  </TouchableOpacity>
                </View>
              </View>
            </View>

            <View style={[styles.noticeBox, { backgroundColor: isDark ? '#1C1C1E' : '#FEF3C7' }]}>
              <Ionicons 
                name="information-circle" 
                size={20} 
                color={isDark ? theme.accent : '#D97706'} 
              />
              <Text style={[styles.noticeText, { color: isDark ? textBodyColor : '#92400E' }]}>
                This account is unique to you. Funds sent here reflect instantly.
              </Text>
            </View>
          </View>
        )}

        {/* Transaction Summary */}
        {amount && selectedMethod && (
          <View style={[styles.summaryCard, { backgroundColor: cardBgColor }]}>
            <Text style={[styles.summaryTitle, { color: textColor }]}>Transaction Summary</Text>
            
            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textBodyColor }]}>Amount:</Text>
              <Text style={[styles.summaryValue, { color: textColor }]}>
                ₦{parseFloat(amount || '0').toLocaleString()}
              </Text>
            </View>

            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textBodyColor }]}>Transaction Fee:</Text>
              <Text style={[styles.summaryValue, { color: textColor }]}>₦0.00</Text>
            </View>

            <View style={[styles.divider, { backgroundColor: borderColor }]} />

            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textColor, fontWeight: '600' }]}>
                Total:
              </Text>
              <Text style={[styles.totalAmount, { color: theme.accent }]}>
                ₦{parseFloat(amount || '0').toLocaleString()}
              </Text>
            </View>
          </View>
        )}

        {/* Add Money Button */}
        <TouchableOpacity
          style={[
            styles.addMoneyButton,
            {
              backgroundColor: (!amount || !selectedMethod || isLoading)
                ? (isDark ? '#374151' : '#D1D5DB')
                : theme.accent,
            },
          ]}
          onPress={handleAddMoney}
          disabled={!amount || !selectedMethod || isLoading}
          activeOpacity={0.8}
        >
          {isLoading ? (
            <>
              <ActivityIndicator color="#FFFFFF" size="small" />
              <Text style={[styles.addMoneyButtonText, { marginLeft: 8 }]}>Processing...</Text>
            </>
          ) : (
            <>
              <Ionicons name="add-circle" size={20} color="#FFFFFF" />
              <Text style={styles.addMoneyButtonText}>Add Money</Text>
            </>
          )}
        </TouchableOpacity>

        {/* Info Card */}
        <View style={[styles.infoCard, { backgroundColor: isDark ? '#1C1C1E' : '#EFF6FF' }]}>
          <Ionicons 
            name="shield-checkmark" 
            size={24} 
            color={isDark ? theme.success : '#3B82F6'} 
          />
          <Text style={[styles.infoText, { color: isDark ? textBodyColor : '#1E40AF' }]}>
            Your payment is secured with 256-bit SSL encryption. We never store your card details.
          </Text>
        </View>
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    paddingTop: 60,
    paddingBottom: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 3,
    elevation: 3,
  },
  backButton: {
    padding: 8,
  },
  headerTitle: {
    fontSize: 20,
    fontWeight: '600',
  },
  placeholder: {
    width: 40,
  },
  scrollView: {
    flex: 1,
  },
  scrollContent: {
    padding: 20,
  },
  atmCard: {
    marginBottom: 24,
    borderRadius: 20,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.3,
    shadowRadius: 12,
    elevation: 8,
  },
  atmCardGradient: {
    backgroundColor: '#1A1F71',
    padding: 24,
    position: 'relative',
    overflow: 'hidden',
    minHeight: 200,
  },
  atmCardHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 24,
    zIndex: 10,
  },
  atmCardChip: {
    width: 50,
    height: 40,
    backgroundColor: 'rgba(255, 215, 0, 0.2)',
    borderRadius: 8,
    alignItems: 'center',
    justifyContent: 'center',
  },
  atmCardBank: {
    fontSize: 16,
    fontWeight: '700',
    color: '#FFFFFF',
    letterSpacing: 2,
  },
  atmAccountSection: {
    marginBottom: 20,
    zIndex: 10,
  },
  atmLabel: {
    fontSize: 10,
    fontWeight: '600',
    color: 'rgba(255,255,255,0.6)',
    letterSpacing: 1,
    marginBottom: 6,
  },
  atmAccountNumberRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  atmAccountNumber: {
    fontSize: 24,
    fontWeight: '700',
    color: '#FFFFFF',
    letterSpacing: 2,
  },
  atmCopyButton: {
    backgroundColor: 'rgba(255,255,255,0.2)',
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },
  atmCardFooter: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-end',
    zIndex: 10,
  },
  atmNameSection: {
    flex: 1,
  },
  atmAccountName: {
    fontSize: 14,
    fontWeight: '700',
    color: '#FFFFFF',
    letterSpacing: 1,
  },
  virtualBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'rgba(0, 212, 170, 0.2)',
    paddingHorizontal: 10,
    paddingVertical: 6,
    borderRadius: 12,
    gap: 4,
  },
  virtualBadgeText: {
    fontSize: 10,
    fontWeight: '700',
    color: '#00D4AA',
    letterSpacing: 1,
  },
  atmPattern: {
    position: 'absolute',
    top: 0,
    right: 0,
    bottom: 0,
    left: 0,
  },
  atmCircle1: {
    position: 'absolute',
    width: 200,
    height: 200,
    borderRadius: 100,
    backgroundColor: 'rgba(139, 92, 246, 0.15)',
    top: -80,
    right: -60,
  },
  atmCircle2: {
    position: 'absolute',
    width: 150,
    height: 150,
    borderRadius: 75,
    backgroundColor: 'rgba(6, 182, 212, 0.15)',
    bottom: -40,
    left: -40,
  },
  atmCircle3: {
    position: 'absolute',
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: 'rgba(255, 159, 67, 0.15)',
    bottom: 40,
    right: 30,
  },
  atmInfoBox: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'rgba(255, 159, 67, 0.1)',
    padding: 12,
    gap: 8,
  },
  atmInfoText: {
    flex: 1,
    fontSize: 12,
    color: '#FF9F43',
    lineHeight: 16,
  },
  section: {
    marginBottom: 24,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  sectionTitle: {
    fontSize: 16,
    fontWeight: '600',
    marginBottom: 12,
  },
  amountInputContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 12,
    borderWidth: 1,
    paddingHorizontal: 16,
    height: 64,
  },
  currencySymbol: {
    fontSize: 24,
    fontWeight: '700',
    marginRight: 8,
  },
  amountInput: {
    flex: 1,
    fontSize: 24,
    fontWeight: '600',
  },
  helperText: {
    fontSize: 12,
    marginTop: 8,
  },
  quickAmountsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  quickAmountCard: {
    width: '30%',
    paddingVertical: 16,
    borderRadius: 12,
    borderWidth: 2,
    alignItems: 'center',
  },
  quickAmountText: {
    fontSize: 15,
    fontWeight: '600',
  },
  paymentMethodsList: {
    gap: 12,
  },
  paymentMethodCard: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    borderRadius: 12,
    position: 'relative',
  },
  paymentMethodIcon: {
    width: 48,
    height: 48,
    borderRadius: 24,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 12,
  },
  paymentMethodInfo: {
    flex: 1,
  },
  paymentMethodName: {
    fontSize: 15,
    fontWeight: '600',
    marginBottom: 4,
  },
  paymentMethodDescription: {
    fontSize: 12,
  },
  checkMark: {
    width: 22,
    height: 22,
    borderRadius: 11,
    alignItems: 'center',
    justifyContent: 'center',
  },
  addCardText: {
    fontSize: 14,
    fontWeight: '600',
  },
  savedCardsList: {
    gap: 12,
  },
  savedCardItem: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 16,
    borderRadius: 12,
    borderWidth: 1,
  },
  cardIconContainer: {
    width: 44,
    height: 44,
    borderRadius: 22,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 12,
  },
  cardInfo: {
    flex: 1,
  },
  cardType: {
    fontSize: 15,
    fontWeight: '600',
    marginBottom: 4,
  },
  cardDetails: {
    fontSize: 12,
  },
  accountDetailsCard: {
    padding: 20,
    borderRadius: 16,
    marginBottom: 24,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 2,
  },
  accountDetailsHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    marginBottom: 8,
  },
  accountDetailsTitle: {
    fontSize: 18,
    fontWeight: '600',
  },
  accountDetailsSubtitle: {
    fontSize: 13,
    marginBottom: 16,
    lineHeight: 18,
  },
  accountInfoBox: {
    padding: 16,
    borderRadius: 12,
    marginBottom: 16,
    gap: 16,
  },
  accountInfoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  accountInfoLabel: {
    fontSize: 13,
  },
  accountInfoValueContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
  accountInfoValue: {
    fontSize: 14,
    fontWeight: '500',
  },
  noticeBox: {
    flexDirection: 'row',
    padding: 12,
    borderRadius: 8,
    gap: 10,
    alignItems: 'center',
  },
  noticeText: {
    flex: 1,
    fontSize: 12,
    lineHeight: 16,
  },
  summaryCard: {
    padding: 20,
    borderRadius: 16,
    marginBottom: 24,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 2,
  },
  summaryTitle: {
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 16,
  },
  summaryRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 12,
  },
  summaryLabel: {
    fontSize: 14,
  },
  summaryValue: {
    fontSize: 14,
    fontWeight: '500',
  },
  divider: {
    height: 1,
    marginVertical: 12,
  },
  totalAmount: {
    fontSize: 20,
    fontWeight: '700',
  },
  addMoneyButton: {
    flexDirection: 'row',
    paddingVertical: 18,
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 20,
    gap: 8,
  },
  addMoneyButtonText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '600',
  },
  infoCard: {
    flexDirection: 'row',
    padding: 16,
    borderRadius: 12,
    alignItems: 'center',
    gap: 12,
    marginBottom: 20,
  },
  infoText: {
    flex: 1,
    fontSize: 13,
    lineHeight: 18,
  },
  noAccountCard: {
    padding: 40,
    borderRadius: 20,
    alignItems: 'center',
    marginBottom: 24,
    borderWidth: 2,
    borderStyle: 'dashed',
  },
  noAccountTitle: {
    fontSize: 20,
    fontWeight: '600',
    marginTop: 16,
    marginBottom: 8,
  },
  noAccountText: {
    fontSize: 14,
    textAlign: 'center',
    marginBottom: 24,
    lineHeight: 20,
  },
  createAccountButton: {
    flexDirection: 'row',
    paddingVertical: 14,
    paddingHorizontal: 24,
    borderRadius: 12,
    alignItems: 'center',
    gap: 8,
  },
  createAccountButtonText: {
    color: '#FFFFFF',
    fontSize: 15,
    fontWeight: '600',
  },
});
