import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  TextInput,
  useColorScheme,
  Modal,
  Animated,
  ActivityIndicator,
} from 'react-native';
import { useRouter } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';
import { billPaymentService } from '@/services/billpayment.service';
import { useAlert } from '@/components/AlertContext';

const theme = {
  primary: '#0A2540',
  accent: '#FF9F43',
  success: '#00D4AA',
  error: '#FF5B5B',
};

export default function BuyDataScreen() {
  const router = useRouter();
  const colorScheme = useColorScheme();
  const isDark = colorScheme === 'dark';

  const bgColor = isDark ? '#000000' : '#F9FAFB';
  const cardBgColor = isDark ? '#1C1C1E' : '#FFFFFF';
  const textColor = isDark ? '#FFFFFF' : '#1F2937';
  const textBodyColor = isDark ? '#D1D5DB' : '#6B7280';
  const borderColor = isDark ? '#374151' : '#E5E7EB';

  const { showSuccess, showError } = useAlert();
  const [phoneNumber, setPhoneNumber] = useState('');
  const [selectedPlan, setSelectedPlan] = useState<any>(null);
  const [selectedNetwork, setSelectedNetwork] = useState<string | null>(null);
  const [showSuccessModal, setShowSuccessModal] = useState(false);
  const [isLoading, setIsLoading] = useState(false);

  const networks = [
    { id: 'mtn', name: 'MTN', color: '#FFCC00', icon: 'phone-portrait' },
    { id: 'glo', name: 'Glo', color: '#00A95C', icon: 'phone-portrait' },
    { id: 'airtel', name: 'Airtel', color: '#FF0000', icon: 'phone-portrait' },
    { id: '9mobile', name: '9mobile', color: '#00693E', icon: 'phone-portrait' },
  ];

  const dataPlans = {
    mtn: [
      { id: 1, data: '500MB', validity: '30 days', price: 500 },
      { id: 2, data: '1GB', validity: '30 days', price: 1000 },
      { id: 3, data: '2GB', validity: '30 days', price: 2000 },
      { id: 4, data: '3GB', validity: '30 days', price: 3000 },
      { id: 5, data: '5GB', validity: '30 days', price: 5000 },
      { id: 6, data: '10GB', validity: '30 days', price: 10000 },
      { id: 7, data: '15GB', validity: '30 days', price: 15000 },
      { id: 8, data: '20GB', validity: '30 days', price: 20000 },
    ],
    glo: [
      { id: 1, data: '500MB', validity: '14 days', price: 500 },
      { id: 2, data: '1GB', validity: '30 days', price: 1000 },
      { id: 3, data: '2GB', validity: '30 days', price: 2000 },
      { id: 4, data: '3.5GB', validity: '30 days', price: 3000 },
      { id: 5, data: '5.8GB', validity: '30 days', price: 5000 },
      { id: 6, data: '10GB', validity: '30 days', price: 10000 },
      { id: 7, data: '13.25GB', validity: '30 days', price: 13000 },
      { id: 8, data: '18GB', validity: '30 days', price: 18000 },
    ],
    airtel: [
      { id: 1, data: '750MB', validity: '14 days', price: 500 },
      { id: 2, data: '1.5GB', validity: '30 days', price: 1000 },
      { id: 3, data: '3GB', validity: '30 days', price: 2000 },
      { id: 4, data: '4.5GB', validity: '30 days', price: 3000 },
      { id: 5, data: '6GB', validity: '30 days', price: 5000 },
      { id: 6, data: '11GB', validity: '30 days', price: 10000 },
      { id: 7, data: '16GB', validity: '30 days', price: 15000 },
      { id: 8, data: '22GB', validity: '30 days', price: 20000 },
    ],
    '9mobile': [
      { id: 1, data: '650MB', validity: '7 days', price: 500 },
      { id: 2, data: '1.5GB', validity: '30 days', price: 1000 },
      { id: 3, data: '2.5GB', validity: '30 days', price: 2000 },
      { id: 4, data: '4GB', validity: '30 days', price: 3000 },
      { id: 5, data: '5.5GB', validity: '30 days', price: 5000 },
      { id: 6, data: '11.5GB', validity: '30 days', price: 10000 },
      { id: 7, data: '15GB', validity: '30 days', price: 15000 },
      { id: 8, data: '27.5GB', validity: '30 days', price: 20000 },
    ],
  };

  const handleBuyData = async () => {
    // Validation
    if (!phoneNumber || !selectedNetwork || !selectedPlan) {
      showError('Please fill all required fields');
      return;
    }

    // Validate phone number format
    const cleanPhone = phoneNumber.replace(/\D/g, '');
    if (cleanPhone.length < 10 || cleanPhone.length > 11) {
      showError('Please enter a valid phone number');
      return;
    }

    setIsLoading(true);

    try {
      const response = await billPaymentService.purchaseData({
        network: selectedNetwork,
        phone: cleanPhone,
        plan: selectedPlan.id.toString(),
        ported_number: true,
      });

      if (response.success) {
        showSuccess(`Data purchase successful! ${selectedPlan.data} sent to ${phoneNumber}`);
        // Reset form
        setPhoneNumber('');
        setSelectedPlan(null);
        setSelectedNetwork(null);
        // Navigate back after short delay
        setTimeout(() => {
          router.back();
        }, 2000);
      } else {
        showError(response.message || 'Failed to purchase data');
      }
    } catch (error: any) {
      showError(error.message || 'Failed to purchase data. Please try again.');
    } finally {
      setIsLoading(false);
    }
  };

  const currentPlans = selectedNetwork ? dataPlans[selectedNetwork as keyof typeof dataPlans] : [];

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
        <Text style={[styles.headerTitle, { color: textColor }]}>Buy Data</Text>
        <View style={styles.placeholder} />
      </View>

      <ScrollView
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.scrollContent}
      >
        {/* Network Selection */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Select Network</Text>
          <View style={styles.networksGrid}>
            {networks.map((network) => (
              <TouchableOpacity
                key={network.id}
                style={[
                  styles.networkCard,
                  { 
                    backgroundColor: cardBgColor,
                    borderColor: selectedNetwork === network.id ? network.color : borderColor,
                    borderWidth: 2,
                  },
                ]}
                onPress={() => {
                  setSelectedNetwork(network.id);
                  setSelectedPlan(null); // Reset plan when network changes
                }}
                activeOpacity={0.7}
              >
                <View
                  style={[
                    styles.networkIcon,
                    {
                      backgroundColor: `${network.color}20`,
                    },
                  ]}
                >
                  <Ionicons
                    name={network.icon as any}
                    size={24}
                    color={network.color}
                  />
                </View>
                <Text style={[styles.networkName, { color: textColor }]}>
                  {network.name}
                </Text>
                {selectedNetwork === network.id && (
                  <View style={[styles.checkMark, { backgroundColor: network.color }]}>
                    <Ionicons name="checkmark" size={14} color="#FFFFFF" />
                  </View>
                )}
              </TouchableOpacity>
            ))}
          </View>
        </View>

        {/* Phone Number Input */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Phone Number</Text>
          <View style={[styles.inputContainer, { backgroundColor: cardBgColor, borderColor }]}>
            <Ionicons name="call-outline" size={20} color={textBodyColor} style={styles.inputIcon} />
            <TextInput
              style={[styles.input, { color: textColor }]}
              placeholder="Enter phone number"
              placeholderTextColor={textBodyColor}
              value={phoneNumber}
              onChangeText={setPhoneNumber}
              keyboardType="phone-pad"
              maxLength={11}
            />
          </View>
        </View>

        {/* Data Plans Selection */}
        {selectedNetwork && (
          <View style={styles.section}>
            <Text style={[styles.sectionTitle, { color: textColor }]}>Select Data Plan</Text>
            <View style={styles.plansGrid}>
              {currentPlans.map((plan) => (
                <TouchableOpacity
                  key={plan.id}
                  style={[
                    styles.planCard,
                    {
                      backgroundColor: selectedPlan?.id === plan.id 
                        ? (isDark ? theme.primary : theme.primary)
                        : cardBgColor,
                      borderColor: selectedPlan?.id === plan.id 
                        ? theme.accent 
                        : borderColor,
                    },
                  ]}
                  onPress={() => setSelectedPlan(plan)}
                  activeOpacity={0.7}
                >
                  <View style={styles.planHeader}>
                    <Ionicons 
                      name="wifi" 
                      size={20} 
                      color={selectedPlan?.id === plan.id ? '#FFFFFF' : theme.accent} 
                    />
                    <Text
                      style={[
                        styles.planData,
                        {
                          color: selectedPlan?.id === plan.id ? '#FFFFFF' : textColor,
                        },
                      ]}
                    >
                      {plan.data}
                    </Text>
                  </View>
                  <Text
                    style={[
                      styles.planValidity,
                      {
                        color: selectedPlan?.id === plan.id ? '#E5E7EB' : textBodyColor,
                      },
                    ]}
                  >
                    {plan.validity}
                  </Text>
                  <Text
                    style={[
                      styles.planPrice,
                      {
                        color: selectedPlan?.id === plan.id ? '#FFFFFF' : theme.accent,
                      },
                    ]}
                  >
                    ₦{plan.price.toLocaleString()}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>
          </View>
        )}

        {/* Transaction Summary */}
        {selectedPlan && phoneNumber && selectedNetwork && (
          <View style={[styles.summaryCard, { backgroundColor: cardBgColor }]}>
            <Text style={[styles.summaryTitle, { color: textColor }]}>Transaction Summary</Text>
            
            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textBodyColor }]}>Network:</Text>
              <Text style={[styles.summaryValue, { color: textColor }]}>
                {networks.find(n => n.id === selectedNetwork)?.name}
              </Text>
            </View>

            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textBodyColor }]}>Phone Number:</Text>
              <Text style={[styles.summaryValue, { color: textColor }]}>{phoneNumber}</Text>
            </View>

            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textBodyColor }]}>Data Plan:</Text>
              <Text style={[styles.summaryValue, { color: textColor }]}>
                {selectedPlan.data}
              </Text>
            </View>

            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textBodyColor }]}>Validity:</Text>
              <Text style={[styles.summaryValue, { color: textColor }]}>
                {selectedPlan.validity}
              </Text>
            </View>

            <View style={[styles.divider, { backgroundColor: borderColor }]} />

            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textColor, fontWeight: '600' }]}>
                Total:
              </Text>
              <Text style={[styles.totalAmount, { color: theme.accent }]}>
                ₦{selectedPlan.price.toLocaleString()}
              </Text>
            </View>
          </View>
        )}

        {/* Buy Button */}
        <TouchableOpacity
          style={[
            styles.buyButton,
            {
              backgroundColor: (!phoneNumber || !selectedNetwork || !selectedPlan || isLoading)
                ? (isDark ? '#374151' : '#D1D5DB')
                : theme.accent,
            },
          ]}
          onPress={handleBuyData}
          disabled={!phoneNumber || !selectedNetwork || !selectedPlan || isLoading}
          activeOpacity={0.8}
        >
          {isLoading ? (
            <ActivityIndicator color="#FFFFFF" />
          ) : (
            <Text style={styles.buyButtonText}>
              Buy Data
            </Text>
          )}
        </TouchableOpacity>

        {/* Info Card */}
        <View style={[styles.infoCard, { backgroundColor: isDark ? '#1C1C1E' : '#EFF6FF' }]}>
          <Ionicons 
            name="information-circle-outline" 
            size={24} 
            color={isDark ? theme.accent : '#3B82F6'} 
          />
          <Text style={[styles.infoText, { color: isDark ? textBodyColor : '#1E40AF' }]}>
            Data will be delivered instantly to the phone number provided
          </Text>
        </View>
      </ScrollView>

      {/* Success Modal */}
      <Modal
        visible={showSuccessModal}
        transparent={true}
        animationType="fade"
      >
        <View style={styles.successModalBackdrop}>
          <View style={[styles.successModalCard, { backgroundColor: isDark ? '#1A1A1A' : '#FFFFFF' }]}>
            <View style={styles.successIconContainer}>
              <Ionicons name="checkmark-circle" size={80} color={theme.success} />
            </View>
            
            <Text style={[styles.successTitle, { color: isDark ? '#FFFFFF' : theme.textPrimary }]}>
              Data Purchase Successful!
            </Text>
            
            <View style={styles.successDetails}>
              <View style={styles.successDetailRow}>
                <Text style={[styles.successLabel, { color: isDark ? textBodyColor : theme.textSecondary }]}>
                  Network:
                </Text>
                <Text style={[styles.successValue, { color: isDark ? '#FFFFFF' : theme.textPrimary }]}>
                  {selectedNetwork?.toUpperCase()}
                </Text>
              </View>
              
              <View style={styles.successDetailRow}>
                <Text style={[styles.successLabel, { color: isDark ? textBodyColor : theme.textSecondary }]}>
                  Phone Number:
                </Text>
                <Text style={[styles.successValue, { color: isDark ? '#FFFFFF' : theme.textPrimary }]}>
                  {phoneNumber}
                </Text>
              </View>
              
              <View style={styles.successDetailRow}>
                <Text style={[styles.successLabel, { color: isDark ? textBodyColor : theme.textSecondary }]}>
                  Data Plan:
                </Text>
                <Text style={[styles.successValue, { color: isDark ? '#FFFFFF' : theme.textPrimary }]}>
                  {selectedPlan?.name}
                </Text>
              </View>
              
              <View style={styles.successDetailRow}>
                <Text style={[styles.successLabel, { color: isDark ? textBodyColor : theme.textSecondary }]}>
                  Amount:
                </Text>
                <Text style={[styles.successValue, { color: theme.success }]}>
                  ₦{selectedPlan?.price.toLocaleString()}
                </Text>
              </View>
            </View>

            <View style={[styles.successCheckmark, { backgroundColor: theme.success + '20' }]}>
              <Ionicons name="checkmark" size={20} color={theme.success} />
              <Text style={[styles.successMessage, { color: theme.success }]}>
                Data delivered instantly
              </Text>
            </View>
          </View>
        </View>
      </Modal>
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
  section: {
    marginBottom: 24,
  },
  sectionTitle: {
    fontSize: 16,
    fontWeight: '600',
    marginBottom: 12,
  },
  networksGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  networkCard: {
    width: '47%',
    padding: 16,
    borderRadius: 12,
    alignItems: 'center',
    position: 'relative',
  },
  networkIcon: {
    width: 50,
    height: 50,
    borderRadius: 25,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 8,
  },
  networkName: {
    fontSize: 14,
    fontWeight: '600',
  },
  checkMark: {
    position: 'absolute',
    top: 8,
    right: 8,
    width: 22,
    height: 22,
    borderRadius: 11,
    alignItems: 'center',
    justifyContent: 'center',
  },
  inputContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 12,
    borderWidth: 1,
    paddingHorizontal: 16,
    height: 56,
  },
  inputIcon: {
    marginRight: 12,
  },
  input: {
    flex: 1,
    fontSize: 16,
  },
  plansGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  planCard: {
    width: '47%',
    padding: 16,
    borderRadius: 12,
    borderWidth: 2,
  },
  planHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    marginBottom: 8,
  },
  planData: {
    fontSize: 18,
    fontWeight: '700',
  },
  planValidity: {
    fontSize: 12,
    marginBottom: 8,
  },
  planPrice: {
    fontSize: 16,
    fontWeight: '600',
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
  buyButton: {
    paddingVertical: 18,
    borderRadius: 12,
    alignItems: 'center',
    marginBottom: 20,
  },
  buyButtonText: {
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
  successModalBackdrop: {
    flex: 1,
    backgroundColor: 'rgba(0, 0, 0, 0.6)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  successModalCard: {
    width: '100%',
    maxWidth: 400,
    borderRadius: 24,
    padding: 32,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.3,
    shadowRadius: 16,
    elevation: 10,
  },
  successIconContainer: {
    marginBottom: 20,
  },
  successTitle: {
    fontSize: 24,
    fontWeight: '700',
    textAlign: 'center',
    marginBottom: 24,
  },
  successDetails: {
    width: '100%',
    gap: 16,
    marginBottom: 24,
  },
  successDetailRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  successLabel: {
    fontSize: 14,
    fontWeight: '500',
  },
  successValue: {
    fontSize: 14,
    fontWeight: '700',
  },
  successCheckmark: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingVertical: 12,
    paddingHorizontal: 20,
    borderRadius: 12,
  },
  successMessage: {
    fontSize: 14,
    fontWeight: '600',
  },
});
