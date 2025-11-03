import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  TextInput,
  useColorScheme,
} from 'react-native';
import { useRouter } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';

const theme = {
  primary: '#0A2540',
  accent: '#FF9F43',
  success: '#00D4AA',
  error: '#FF5B5B',
};

export default function BuyAirtimeScreen() {
  const router = useRouter();
  const colorScheme = useColorScheme();
  const isDark = colorScheme === 'dark';

  const bgColor = isDark ? '#000000' : '#F9FAFB';
  const cardBgColor = isDark ? '#1C1C1E' : '#FFFFFF';
  const textColor = isDark ? '#FFFFFF' : '#1F2937';
  const textBodyColor = isDark ? '#D1D5DB' : '#6B7280';
  const borderColor = isDark ? '#374151' : '#E5E7EB';

  const [phoneNumber, setPhoneNumber] = useState('');
  const [selectedAmount, setSelectedAmount] = useState<number | null>(null);
  const [customAmount, setCustomAmount] = useState('');
  const [selectedNetwork, setSelectedNetwork] = useState<string | null>(null);

  const networks = [
    { id: 'mtn', name: 'MTN', color: '#FFCC00', icon: 'phone-portrait' },
    { id: 'glo', name: 'Glo', color: '#00A95C', icon: 'phone-portrait' },
    { id: 'airtel', name: 'Airtel', color: '#FF0000', icon: 'phone-portrait' },
    { id: '9mobile', name: '9mobile', color: '#00693E', icon: 'phone-portrait' },
  ];

  const quickAmounts = [100, 200, 500, 1000, 2000, 5000];

  const handleBuyAirtime = () => {
    if (!phoneNumber || !selectedNetwork || (!selectedAmount && !customAmount)) {
      alert('Please fill all required fields');
      return;
    }
    // Handle airtime purchase logic here
    alert('Airtime purchase successful!');
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
        <Text style={[styles.headerTitle, { color: textColor }]}>Buy Airtime</Text>
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
                onPress={() => setSelectedNetwork(network.id)}
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

        {/* Quick Amount Selection */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Select Amount</Text>
          <View style={styles.amountsGrid}>
            {quickAmounts.map((amount) => (
              <TouchableOpacity
                key={amount}
                style={[
                  styles.amountCard,
                  {
                    backgroundColor: selectedAmount === amount 
                      ? (isDark ? theme.primary : theme.primary)
                      : cardBgColor,
                    borderColor: selectedAmount === amount 
                      ? theme.accent 
                      : borderColor,
                  },
                ]}
                onPress={() => {
                  setSelectedAmount(amount);
                  setCustomAmount('');
                }}
                activeOpacity={0.7}
              >
                <Text
                  style={[
                    styles.amountText,
                    {
                      color: selectedAmount === amount ? '#FFFFFF' : textColor,
                    },
                  ]}
                >
                  ₦{amount}
                </Text>
              </TouchableOpacity>
            ))}
          </View>
        </View>

        {/* Custom Amount Input */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Or Enter Custom Amount</Text>
          <View style={[styles.inputContainer, { backgroundColor: cardBgColor, borderColor }]}>
            <Text style={[styles.currencySymbol, { color: textBodyColor }]}>₦</Text>
            <TextInput
              style={[styles.input, { color: textColor }]}
              placeholder="Enter amount"
              placeholderTextColor={textBodyColor}
              value={customAmount}
              onChangeText={(text) => {
                setCustomAmount(text);
                setSelectedAmount(null);
              }}
              keyboardType="numeric"
            />
          </View>
          <Text style={[styles.helperText, { color: textBodyColor }]}>
            Minimum: ₦50 • Maximum: ₦50,000
          </Text>
        </View>

        {/* Transaction Summary */}
        {(selectedAmount || customAmount) && phoneNumber && selectedNetwork && (
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
              <Text style={[styles.summaryLabel, { color: textBodyColor }]}>Amount:</Text>
              <Text style={[styles.summaryValue, { color: textColor }]}>
                ₦{selectedAmount || customAmount}
              </Text>
            </View>

            <View style={[styles.divider, { backgroundColor: borderColor }]} />

            <View style={styles.summaryRow}>
              <Text style={[styles.summaryLabel, { color: textColor, fontWeight: '600' }]}>
                Total:
              </Text>
              <Text style={[styles.totalAmount, { color: theme.accent }]}>
                ₦{selectedAmount || customAmount}
              </Text>
            </View>
          </View>
        )}

        {/* Buy Button */}
        <TouchableOpacity
          style={[
            styles.buyButton,
            {
              backgroundColor: (!phoneNumber || !selectedNetwork || (!selectedAmount && !customAmount))
                ? (isDark ? '#374151' : '#D1D5DB')
                : theme.accent,
            },
          ]}
          onPress={handleBuyAirtime}
          disabled={!phoneNumber || !selectedNetwork || (!selectedAmount && !customAmount)}
          activeOpacity={0.8}
        >
          <Text style={styles.buyButtonText}>
            Buy Airtime
          </Text>
        </TouchableOpacity>

        {/* Recent Transactions Info */}
        <View style={[styles.infoCard, { backgroundColor: isDark ? '#1C1C1E' : '#EFF6FF' }]}>
          <Ionicons 
            name="information-circle-outline" 
            size={24} 
            color={isDark ? theme.accent : '#3B82F6'} 
          />
          <Text style={[styles.infoText, { color: isDark ? textBodyColor : '#1E40AF' }]}>
            Airtime will be delivered instantly to the phone number provided
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
  currencySymbol: {
    fontSize: 16,
    fontWeight: '600',
    marginRight: 8,
  },
  amountsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  amountCard: {
    width: '30%',
    paddingVertical: 16,
    borderRadius: 12,
    borderWidth: 2,
    alignItems: 'center',
  },
  amountText: {
    fontSize: 16,
    fontWeight: '600',
  },
  helperText: {
    fontSize: 12,
    marginTop: 8,
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
});
