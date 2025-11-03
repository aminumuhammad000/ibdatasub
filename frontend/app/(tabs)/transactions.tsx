import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  useColorScheme,
  StatusBar,
  TouchableOpacity,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import BottomTabBar from '@/components/BottomTabBar';

export default function TransactionsScreen() {
  const colorScheme = useColorScheme();
  const isDark = colorScheme === 'dark';

  const theme = {
    primary: '#0A2540',
    accent: '#FF9F43',
    backgroundLight: '#F8F9FA',
    backgroundDark: '#111921',
    textHeadings: '#1E293B',
    textBody: '#475569',
  };

  const bgColor = isDark ? theme.backgroundDark : theme.backgroundLight;
  const textColor = isDark ? '#FFFFFF' : theme.textHeadings;
  const textBodyColor = isDark ? '#9CA3AF' : theme.textBody;
  const cardBg = isDark ? '#1F2937' : '#F3F4F6';

  const transactions = [
    {
      id: 1,
      name: 'MTN Airtime Top-up',
      phone: '08012345678',
      amount: '-₦500.00',
      status: 'Successful',
      date: 'Today, 10:30 AM',
      bgColor: '#FFCB05',
    },
    {
      id: 2,
      name: 'Airtel Data',
      phone: '09087654321',
      amount: '-₦1,500.00',
      status: 'Successful',
      date: 'Yesterday, 3:45 PM',
      bgColor: '#EF4444',
    },
    {
      id: 3,
      name: 'DSTV Subscription',
      phone: '1234567890',
      amount: '-₦4,500.00',
      status: 'Failed',
      date: 'Nov 1, 2025',
      bgColor: '#2563EB',
    },
    {
      id: 4,
      name: 'Glo Airtime',
      phone: '08023456789',
      amount: '-₦200.00',
      status: 'Successful',
      date: 'Oct 31, 2025',
      bgColor: '#10B981',
    },
  ];

  return (
    <View style={[styles.container, { backgroundColor: bgColor }]}>
      <StatusBar barStyle={isDark ? 'light-content' : 'dark-content'} />
      
      {/* Header */}
      <View style={[styles.header, { backgroundColor: bgColor }]}>
        <Text style={[styles.headerTitle, { color: textColor }]}>Transactions</Text>
        <TouchableOpacity style={styles.filterBtn}>
          <Ionicons name="filter-outline" size={24} color={textColor} />
        </TouchableOpacity>
      </View>

      <ScrollView 
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.scrollContent}
      >
        <View style={styles.transactionsList}>
          {transactions.map((transaction) => (
            <TouchableOpacity 
              key={transaction.id} 
              style={[styles.transactionItem, { backgroundColor: cardBg }]}
              activeOpacity={0.7}
            >
              <View style={[styles.transactionLogo, { backgroundColor: transaction.bgColor }]}>
                <View style={styles.logoPlaceholder} />
              </View>
              <View style={styles.transactionDetails}>
                <Text style={[styles.transactionName, { color: textColor }]}>{transaction.name}</Text>
                <Text style={[styles.transactionDate, { color: textBodyColor }]}>{transaction.date}</Text>
              </View>
              <View style={styles.transactionRight}>
                <Text style={[styles.transactionAmount, { color: textColor }]}>{transaction.amount}</Text>
                <Text style={[
                  styles.transactionStatus,
                  { color: transaction.status === 'Successful' ? '#10B981' : '#EF4444' }
                ]}>
                  {transaction.status}
                </Text>
              </View>
            </TouchableOpacity>
          ))}
        </View>

        <View style={{ height: 100 }} />
      </ScrollView>

      <BottomTabBar />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  scrollView: {
    flex: 1,
  },
  scrollContent: {
    paddingBottom: 20,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 12,
    paddingTop: 50,
  },
  headerTitle: {
    fontSize: 24,
    fontWeight: '700',
  },
  filterBtn: {
    padding: 8,
  },
  transactionsList: {
    paddingHorizontal: 16,
    marginTop: 16,
    gap: 12,
  },
  transactionItem: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: 12,
    borderRadius: 8,
    gap: 16,
  },
  transactionLogo: {
    width: 40,
    height: 40,
    borderRadius: 20,
    justifyContent: 'center',
    alignItems: 'center',
  },
  logoPlaceholder: {
    width: 24,
    height: 24,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 12,
  },
  transactionDetails: {
    flex: 1,
  },
  transactionName: {
    fontSize: 16,
    fontWeight: '600',
    marginBottom: 4,
  },
  transactionDate: {
    fontSize: 14,
  },
  transactionRight: {
    alignItems: 'flex-end',
  },
  transactionAmount: {
    fontSize: 16,
    fontWeight: '700',
    marginBottom: 4,
  },
  transactionStatus: {
    fontSize: 14,
  },
});
