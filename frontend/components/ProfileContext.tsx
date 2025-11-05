import React, { createContext, ReactNode, useContext, useState } from 'react';

export interface ProfileData {
  firstName: string;
  lastName: string;
  email: string;
  phoneNumber: string;
  address: string;
  city: string;
  state: string;
  profileImage: string;
}

interface ProfileContextType {
  profileData: ProfileData;
  updateProfile: (data: ProfileData) => void;
  getFullName: () => string;
}

const ProfileContext = createContext<ProfileContextType | undefined>(undefined);

export const useProfile = () => {
  const context = useContext(ProfileContext);
  if (!context) {
    throw new Error('useProfile must be used within a ProfileProvider');
  }
  return context;
};

interface ProfileProviderProps {
  children: ReactNode;
}

export const ProfileProvider: React.FC<ProfileProviderProps> = ({ children }) => {
  const [profileData, setProfileData] = useState<ProfileData>({
    firstName: 'David',
    lastName: 'Johnson',
    email: 'david.johnson@email.com',
    phoneNumber: '+234 803 123 4567',
    address: '123 Main Street',
    city: 'Lagos',
    state: 'Lagos State',
    profileImage: 'https://i.pravatar.cc/150?img=12',
  });

  const updateProfile = (data: ProfileData) => {
    setProfileData(data);
  };

  const getFullName = () => {
    return `${profileData.firstName} ${profileData.lastName}`;
  };

  return (
    <ProfileContext.Provider value={{ profileData, updateProfile, getFullName }}>
      {children}
    </ProfileContext.Provider>
  );
};