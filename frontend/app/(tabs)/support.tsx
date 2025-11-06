import { useTheme } from '@/components/ThemeContext';
import { Ionicons } from '@expo/vector-icons';
import React from 'react';
import {
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';

export default function SupportScreen() {
  const { isDark } = useTheme();

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

  const supportOptions = [
    { icon: 'chatbubble-outline', label: 'Live Chat', description: 'Chat with our support team' },
    { icon: 'call-outline', label: 'Call Us', description: '+234 800 123 4567' },
    { icon: 'mail-outline', label: 'Email Support', description: 'support@connecta.com' },
    { icon: 'help-circle-outline', label: 'FAQs', description: 'Find answers to common questions' },
  ];

  const faqs = [
    { question: 'How do I buy airtime?', answer: 'Navigate to the home screen and select Buy Airtime...' },
    { question: 'What payment methods are supported?', answer: 'We support card payments, bank transfers...' },
    { question: 'How do I check my transaction history?', answer: 'Go to the Transactions tab...' },
  ];

  return (
    <View style={[styles.container, { backgroundColor: bgColor }]}>
      <StatusBar barStyle={isDark ? 'light-content' : 'dark-content'} />
      
      {/* Header */}
      <View style={[styles.header, { backgroundColor: bgColor }]}>
        <Text style={[styles.headerTitle, { color: textColor }]}>Support</Text>
      </View>

      <ScrollView 
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.scrollContent}
      >
        {/* Contact Options */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Contact Us</Text>
          <View style={styles.optionsGrid}>
            {supportOptions.map((option, index) => (
              <TouchableOpacity
                key={index}
                style={[styles.optionCard, { backgroundColor: cardBg }]}
                activeOpacity={0.7}
              >
                <View style={[styles.optionIcon, { backgroundColor: isDark ? 'rgba(255, 159, 67, 0.2)' : 'rgba(10, 37, 64, 0.1)' }]}>
                  <Ionicons name={option.icon as any} size={24} color={isDark ? theme.accent : theme.primary} />
                </View>
                <Text style={[styles.optionLabel, { color: textColor }]}>{option.label}</Text>
                <Text style={[styles.optionDescription, { color: textBodyColor }]}>{option.description}</Text>
              </TouchableOpacity>
            ))}
          </View>
        </View>

        {/* FAQs */}
        <View style={styles.section}>
          <Text style={[styles.sectionTitle, { color: textColor }]}>Frequently Asked Questions</Text>
          <View style={styles.faqList}>
            {faqs.map((faq, index) => (
              <TouchableOpacity
                key={index}
                style={[styles.faqItem, { backgroundColor: cardBg }]}
                activeOpacity={0.7}
              >
                <View style={styles.faqHeader}>
                  <Text style={[styles.faqQuestion, { color: textColor }]}>{faq.question}</Text>
                  <Ionicons name="chevron-down" size={20} color={textBodyColor} />
                </View>
              </TouchableOpacity>
            ))}
          </View>
        </View>

        <View style={{ height: 120 }} />
      </ScrollView>
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
  section: {
    paddingHorizontal: 16,
    marginTop: 24,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '700',
    marginBottom: 16,
  },
  optionsGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 12,
  },
  optionCard: {
    width: '48%',
    padding: 16,
    borderRadius: 12,
    alignItems: 'center',
  },
  optionIcon: {
    width: 56,
    height: 56,
    borderRadius: 28,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 12,
  },
  optionLabel: {
    fontSize: 16,
    fontWeight: '600',
    marginBottom: 4,
    textAlign: 'center',
  },
  optionDescription: {
    fontSize: 12,
    textAlign: 'center',
  },
  faqList: {
    gap: 12,
  },
  faqItem: {
    padding: 16,
    borderRadius: 8,
  },
  faqHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  faqQuestion: {
    fontSize: 16,
    fontWeight: '500',
    flex: 1,
  },
});



                  

