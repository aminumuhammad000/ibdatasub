export const USE_LOCAL_API = false;

export const API_URLS = {
  LOCAL: 'http://localhost:3000/api',
  PRODUCTION: process.env.NEXT_PUBLIC_APP_URL ? `${process.env.NEXT_PUBLIC_APP_URL}/api` : '/api',
};

export const getApiUrl = () => {
  return USE_LOCAL_API ? API_URLS.LOCAL : API_URLS.PRODUCTION;
};

export const getAdminApiUrl = () => {
  return USE_LOCAL_API ? `${API_URLS.LOCAL}/admin` : `${API_URLS.PRODUCTION}/admin`;
};
