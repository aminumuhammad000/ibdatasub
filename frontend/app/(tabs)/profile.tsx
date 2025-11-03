import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  useColorScheme,
  StatusBar,
  TouchableOpacity,
  Image,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import BottomTabBar from '@/components/BottomTabBar';

export default function ProfileScreen() {
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

  const menuItems = [
    { icon: 'person-outline', label: 'Personal Information', route: '' },
    { icon: 'lock-closed-outline', label: 'Security', route: '' },
    { icon: 'notifications-outline', label: 'Notifications', route: '' },
    { icon: 'card-outline', label: 'Payment Methods', route: '' },
    { icon: 'help-circle-outline', label: 'Help & Support', route: '' },
    { icon: 'information-circle-outline', label: 'About', route: '' },
  ];

  return (
    <View style={[styles.container, { backgroundColor: bgColor }]}>
      <StatusBar barStyle={isDark ? 'light-content' : 'dark-content'} />
      
      {/* Header */}
      <View style={[styles.header, { backgroundColor: bgColor }]}>
        <Text style={[styles.headerTitle, { color: textColor }]}>Profile</Text>
        <TouchableOpacity style={styles.settingsBtn}>
          <Ionicons name="settings-outline" size={24} color={textColor} />
        </TouchableOpacity>
      </View>

      <ScrollView 
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.scrollContent}
      >
        {/* Profile Card */}
        <View style={[styles.profileCard, { backgroundColor: cardBg }]}>
          <View style={styles.profilePic}>
            <Image
              source={{ uri: 'https://i.pravatar.cc/150?img=12' }}
              style={styles.profileImage}
            />
          </View>
          <Text style={[styles.profileName, { color: textColor }]}>David Johnson</Text>
          <Text style={[styles.profileEmail, { color: textBodyColor }]}>david.johnson@email.com</Text>
          <TouchableOpacity style={[styles.editButton, { backgroundColor: theme.primary }]}>
            <Text style={styles.editButtonText}>Edit Profile</Text>
          </TouchableOpacity>
        </View>

        {/* Menu Items */}
        <View style={styles.menuSection}>
          {menuItems.map((item, index) => (
            <TouchableOpacity
              key={index}
              style={[styles.menuItem, { backgroundColor: cardBg }]}
              activeOpacity={0.7}
            >
              <View style={styles.menuItemLeft}>
                <Ionicons name={item.icon as any} size={24} color={isDark ? '#FFFFFF' : theme.primary} />
                <Text style={[styles.menuItemLabel, { color: textColor }]}>{item.label}</Text>
              </View>
              <Ionicons name="chevron-forward" size={20} color={textBodyColor} />
            </TouchableOpacity>
          ))}
        </View>

        {/* Logout Button */}
        <TouchableOpacity style={[styles.logoutButton, { backgroundColor: '#EF4444' }]}>
          <Ionicons name="log-out-outline" size={24} color="#FFFFFF" />
          <Text style={styles.logoutText}>Logout</Text>
        </TouchableOpacity>

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
  settingsBtn: {
    padding: 8,
  },
  profileCard: {
    marginHorizontal: 16,
    marginTop: 16,
    padding: 24,
    borderRadius: 12,
    alignItems: 'center',
  },
  profilePic: {
    width: 80,
    height: 80,
    borderRadius: 40,
    overflow: 'hidden',
    marginBottom: 16,
  },
  profileImage: {
    width: '100%',
    height: '100%',
  },
  profileName: {
    fontSize: 20,
    fontWeight: '700',
    marginBottom: 4,
  },
  profileEmail: {
    fontSize: 14,
    marginBottom: 16,
  },
  editButton: {
    paddingVertical: 10,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  editButtonText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
  },
  menuSection: {
    paddingHorizontal: 16,
    marginTop: 24,
    gap: 12,
  },
  menuItem: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    padding: 16,
    borderRadius: 8,
  },
  menuItemLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 16,
  },
  menuItemLabel: {
    fontSize: 16,
    fontWeight: '500',
  },
  logoutButton: {
    marginHorizontal: 16,
    marginTop: 32,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 14,
    borderRadius: 8,
    gap: 8,
  },
  logoutText: {
    color: '#FFFFFF',
    fontSize: 16,
    fontWeight: '700',
  },
});
