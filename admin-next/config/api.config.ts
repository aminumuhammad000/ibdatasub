export const USE_LOCAL_API = false;

export const API_URLS = {
  LOCAL: 'http://127.0.0.1:5001/api',
  PRODUCTION: 'https://api.ibdata.com.ng/api'
};

export const getApiUrl = () => {
  return USE_LOCAL_API ? API_URLS.LOCAL : API_URLS.PRODUCTION;
};

export const getAdminApiUrl = () => {
  return USE_LOCAL_API ? `${API_URLS.LOCAL}/admin` : `${API_URLS.PRODUCTION}/admin`;
};
