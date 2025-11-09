import { useTheme } from '@/components/ThemeContext';
import TransactionFilter, { FilterOptions } from '@/components/TransactionFilter';
import TransactionReceipt from '@/components/TransactionReceipt';
import { Ionicons } from '@expo/vector-icons';
import React, { useMemo, useState, useEffect } from 'react';
import {
    ScrollView,
    StatusBar,
    StyleSheet,
    Text,
    TouchableOpacity,
    View,
    ActivityIndicator,
    RefreshControl,
} from 'react-native';
import { transactionService, Transaction as ApiTransaction } from '@/services/transaction.service';

interface Transaction {
  id: string;
  name: string;
  phone: string;
  amount: string;
  status: string;
  date: string;
  bgColor: string;
  type?: string;
  transactionId?: string;
  fee?: string;
  totalAmount?: string;
}

export default function TransactionsScreen() {
  const { isDark } = useTheme();
  const [selectedTransaction, setSelectedTransaction] = useState<Transaction | null>(null);
  const [receiptVisible, setReceiptVisible] = useState(false);
  const [filterVisible, setFilterVisible] = useState(false);
  const [filters, setFilters] = useState<FilterOptions>({
    status: [],
    type: [],
    dateRange: 'all',
    amountRange: 'all',
  });
  const [allTransactions, setAllTransactions] = useState<Transaction[]>([]);
  const [loading, setLoading] = useState(true);
  const [refreshing, setRefreshing] = useState(false);

  useEffect(() => {
    loadTransactions();
  }, []);

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

  const loadTransactions = async () => {
    try {
      setLoading(true);
      const response = await transactionService.getTransactions(1, 50);
      if (response.success && response.data) {
        // Backend returns transactions directly in data array, not in data.transactions
        const transactionsArray = Array.isArray(response.data) ? response.data : [];
        const mappedTransactions = transactionsArray.map(mapApiTransactionToLocal);
        setAllTransactions(mappedTransactions);
      } else {
        // If no transactions or invalid response, set empty array
        setAllTransactions([]);
      }
    } catch (error: any) {
      console.error('Error loading transactions:', error);
      setAllTransactions([]);
    } finally {
      setLoading(false);
    }
  };

  const onRefresh = async () => {
    setRefreshing(true);
    await loadTransactions();
    setRefreshing(false);
  };

  const mapApiTransactionToLocal = (transaction: ApiTransaction): Transaction => {
    const date = new Date(transaction.created_at);
    const today = new Date();
    const yesterday = new Date(today);
    yesterday.setDate(yesterday.getDate() - 1);

    let dateString = '';
    if (date.toDateString() === today.toDateString()) {
      dateString = `Today, ${date.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' })}`;
    } else if (date.toDateString() === yesterday.toDateString()) {
      dateString = `Yesterday, ${date.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit' })}`;
    } else {
      dateString = date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' });
    }

    return {
      id: transaction._id,
      name: formatTransactionType(transaction.type),
      phone: transaction.destination_account || transaction.reference_number,
      amount: `₦${transaction.amount.toFixed(2)}`,
      status: transaction.status.charAt(0).toUpperCase() + transaction.status.slice(1),
      date: dateString,
      bgColor: getTransactionColor(transaction.type),
      type: formatTransactionType(transaction.type),
      transactionId: transaction.reference_number,
      fee: `₦${transaction.fee.toFixed(2)}`,
      totalAmount: `₦${transaction.total_charged.toFixed(2)}`,
    };
  };

  const formatTransactionType = (type: string) => {
    return type
      .split('_')
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))
      .join(' ');
  };

  const getTransactionColor = (type: string) => {
    switch (type) {
      case 'airtime_topup':
        return '#FFCB05';
      case 'data_purchase':
        return '#EF4444';
      case 'bill_payment':
        return '#2563EB';
      case 'wallet_topup':
        return '#10B981';
      default:
        return '#6B7280';
    }
  };


  // Filter transactions based on current filters
  const filteredTransactions = useMemo(() => {
    let filtered = allTransactions;

    // Filter by status
    if (filters.status.length > 0) {
      filtered = filtered.filter(transaction => 
        filters.status.includes(transaction.status)
      );
    }

    // Filter by type
    if (filters.type.length > 0) {
      filtered = filtered.filter(transaction => 
        filters.type.includes(transaction.type || '')
      );
    }

    // Filter by date range
    if (filters.dateRange !== 'all') {
      const today = new Date();
      const yesterday = new Date(today);
      yesterday.setDate(yesterday.getDate() - 1);

      filtered = filtered.filter(transaction => {
        const dateStr = transaction.date.toLowerCase();
        
        switch (filters.dateRange) {
          case 'today':
            return dateStr.includes('today');
          case 'yesterday':
            return dateStr.includes('yesterday');
          case 'week':
            // Simple check for recent dates
            return dateStr.includes('today') || dateStr.includes('yesterday') || 
                   dateStr.includes('nov') || dateStr.includes('oct');
          case 'month':
            return dateStr.includes('nov') || dateStr.includes('today') || dateStr.includes('yesterday');
          default:
            return true;
        }
      });
    }

    // Filter by amount range
    if (filters.amountRange !== 'all') {
      filtered = filtered.filter(transaction => {
        const amount = parseFloat(transaction.amount.replace(/[₦,]/g, ''));
        
        switch (filters.amountRange) {
          case '0-500':
            return amount >= 0 && amount <= 500;
          case '500-1000':
            return amount > 500 && amount <= 1000;
          case '1000-5000':
            return amount > 1000 && amount <= 5000;
          case '5000+':
            return amount > 5000;
          default:
            return true;
        }
      });
    }

    return filtered;
  }, [filters]);

  const handleTransactionPress = (transaction: Transaction) => {
    setSelectedTransaction(transaction);
    setReceiptVisible(true);
  };

  const handleCloseReceipt = () => {
    setReceiptVisible(false);
    setSelectedTransaction(null);
  };

  const handleFilterPress = () => {
    setFilterVisible(true);
  };

  const handleCloseFilter = () => {
    setFilterVisible(false);
  };

  const handleApplyFilter = (newFilters: FilterOptions) => {
    setFilters(newFilters);
  };

  const hasActiveFilters = 
    filters.status.length > 0 || 
    filters.type.length > 0 || 
    filters.dateRange !== 'all' || 
    filters.amountRange !== 'all';

  return (
    <View style={[styles.container, { backgroundColor: bgColor }]}>
      <StatusBar barStyle={isDark ? 'light-content' : 'dark-content'} />
      
      {/* Header */}
      <View style={[styles.header, { backgroundColor: bgColor }]}>
        <Text style={[styles.headerTitle, { color: textColor }]}>Transactions</Text>
        <TouchableOpacity 
          style={[
            styles.filterBtn,
            hasActiveFilters && { backgroundColor: theme.primary + '20' }
          ]}
          onPress={handleFilterPress}
        >
          <Ionicons 
            name="filter-outline" 
            size={24} 
            color={hasActiveFilters ? theme.primary : textColor} 
          />
          {hasActiveFilters && (
            <View style={[styles.filterBadge, { backgroundColor: theme.primary }]}>
              <Text style={styles.filterBadgeText}>•</Text>
            </View>
          )}
        </TouchableOpacity>
      </View>

      {loading ? (
        <View style={styles.loadingContainer}>
          <ActivityIndicator size="large" color={theme.primary} />
          <Text style={[styles.loadingText, { color: textBodyColor }]}>Loading transactions...</Text>
        </View>
      ) : (
      <ScrollView 
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.scrollContent}
        refreshControl={
          <RefreshControl
            refreshing={refreshing}
            onRefresh={onRefresh}
            tintColor={theme.primary}
          />
        }
      >
        <View style={styles.transactionsList}>
          {filteredTransactions.length > 0 ? (
            filteredTransactions.map((transaction: Transaction) => (
              <TouchableOpacity 
                key={transaction.id} 
                style={[styles.transactionItem, { backgroundColor: cardBg }]}
                activeOpacity={0.7}
                onPress={() => handleTransactionPress(transaction)}
              >
                <View style={[styles.transactionLogo, { backgroundColor: transaction.bgColor }]}>
                  <View style={styles.logoPlaceholder} />
                </View>
                <View style={styles.transactionDetails}>
                  <Text style={[styles.transactionName, { color: textColor }]}>{transaction.name}</Text>
                  <Text style={[styles.transactionDate, { color: textBodyColor }]}>{transaction.date}</Text>
                </View>
                <View style={styles.transactionRight}>
                  <Text style={[styles.transactionAmount, { color: textColor }]}>-{transaction.amount}</Text>
                  <Text style={[
                    styles.transactionStatus,
                    { color: transaction.status === 'Successful' ? '#10B981' : transaction.status === 'Failed' ? '#EF4444' : '#FF9F43' }
                  ]}>
                    {transaction.status}
                  </Text>
                </View>
                <Ionicons name="chevron-forward" size={20} color={textBodyColor} style={styles.chevron} />
              </TouchableOpacity>
            ))
          ) : (
            <View style={[styles.emptyState, { backgroundColor: cardBg }]}>
              <Ionicons name="receipt-outline" size={48} color={textBodyColor} />
              <Text style={[styles.emptyTitle, { color: textColor }]}>No transactions found</Text>
              <Text style={[styles.emptySubtitle, { color: textBodyColor }]}>
                Try adjusting your filters to see more results
              </Text>
            </View>
          )}
        </View>

        <View style={{ height: 100 }} />
      </ScrollView>
      )}

      <TransactionReceipt
        visible={receiptVisible}
        transaction={selectedTransaction}
        onClose={handleCloseReceipt}
      />

      <TransactionFilter
        visible={filterVisible}
        onClose={handleCloseFilter}
        onApplyFilter={handleApplyFilter}
        currentFilters={filters}
      />
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
    borderRadius: 8,
    position: 'relative',
  },
  filterBadge: {
    position: 'absolute',
    top: 4,
    right: 4,
    width: 8,
    height: 8,
    borderRadius: 4,
    alignItems: 'center',
    justifyContent: 'center',
  },
  filterBadgeText: {
    color: '#FFFFFF',
    fontSize: 12,
    fontWeight: 'bold',
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
  chevron: {
    marginLeft: 8,
  },
  emptyState: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 60,
    paddingHorizontal: 20,
    borderRadius: 12,
  },
  emptyTitle: {
    fontSize: 18,
    fontWeight: '600',
    marginTop: 16,
    marginBottom: 8,
  },
  emptySubtitle: {
    fontSize: 14,
    textAlign: 'center',
    lineHeight: 20,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingTop: 100,
  },
  loadingText: {
    marginTop: 12,
    fontSize: 16,
    fontWeight: '500',
  },
});
