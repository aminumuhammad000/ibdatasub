const axios = require('axios');

const BASE_URL = 'http://localhost:3000/api';
let pass = 0;
let fail = 0;

async function testEndpoint(name, fn) {
  try {
    const res = await fn();
    if (res.status >= 200 && res.status < 300 && res.data && res.data.success !== false) {
      console.log(`  ✅ [PASS] ${name} (${res.status})`);
      pass++;
      return res.data;
    } else {
      console.log(`  ❌ [FAIL] ${name} (${res.status}):`, res.data);
      fail++;
      return null;
    }
  } catch (err) {
    if (err.response) {
      console.log(`  ❌ [FAIL] ${name} (${err.response.status}):`, err.response.data);
    } else {
      console.log(`  ❌ [FAIL] ${name} (Error):`, err.message);
    }
    fail++;
    return null;
  }
}

async function run() {
  console.log('========================================================');
  console.log('Testing Mobile App Endpoints on Next.js Server (Port 3000)');
  console.log('========================================================\n');

  // 1. Health
  await testEndpoint('GET /api (Health Check)', () => axios.get(BASE_URL));

  // 2. Networks
  await testEndpoint('GET /api/billpayment/networks', () => axios.get(`${BASE_URL}/billpayment/networks`));

  // 3. Data Plans
  await testEndpoint('GET /api/billpayment/data-plans', () => axios.get(`${BASE_URL}/billpayment/data-plans?network=mtn`));

  // 4. Electricity providers
  await testEndpoint('GET /api/billpayment/electricity-providers', () => axios.get(`${BASE_URL}/billpayment/electricity-providers`));

  // 5. Gateway settings
  await testEndpoint('GET /api/payment/gateway-settings', () => axios.get(`${BASE_URL}/payment/gateway-settings`));

  // 6. Support content
  await testEndpoint('GET /api/support-content', () => axios.get(`${BASE_URL}/support-content`));

  // 7. Referral settings
  await testEndpoint('GET /api/referrals/settings', () => axios.get(`${BASE_URL}/referrals/settings`));

  // 8. Airtime to cash settings
  await testEndpoint('GET /api/airtime-to-cash/settings', () => axios.get(`${BASE_URL}/airtime-to-cash/settings`));

  // 9. Register
  const ts = Date.now();
  const regRes = await testEndpoint('POST /api/auth/register', () => axios.post(`${BASE_URL}/auth/register`, {
    first_name: 'Mobile',
    last_name: 'Tester',
    email: `tester_${ts}@example.com`,
    password: 'Password@123',
    phone_number: `081${String(ts).slice(-8)}`,
    pin: '1234'
  }));

  let token = regRes?.data?.token;

  // 10. Login
  const loginRes = await testEndpoint('POST /api/auth/login', () => axios.post(`${BASE_URL}/auth/login`, {
    email: `tester_${ts}@example.com`,
    password: 'Password@123'
  }));

  if (!token && loginRes?.data?.token) {
    token = loginRes.data.token;
  }

  const authHeader = { headers: { Authorization: `Bearer ${token}` } };

  // 11. Profile
  await testEndpoint('GET /api/users/profile', () => axios.get(`${BASE_URL}/users/profile`, authHeader));

  // 12. Update Profile
  await testEndpoint('PUT /api/users/profile', () => axios.put(`${BASE_URL}/users/profile`, { city: 'Kano' }, authHeader));

  // 13. Set Pin
  await testEndpoint('POST /api/users/transaction-pin', () => axios.post(`${BASE_URL}/users/transaction-pin`, { pin: '4321' }, authHeader));

  // 14. Update Pin
  await testEndpoint('PUT /api/users/transaction-pin', () => axios.put(`${BASE_URL}/users/transaction-pin`, { current_pin: '4321', new_pin: '1234' }, authHeader));

  // 15. Wallet
  await testEndpoint('GET /api/wallet', () => axios.get(`${BASE_URL}/wallet`, authHeader));

  // 16. Wallet Balance alias
  await testEndpoint('GET /api/wallet/balance', () => axios.get(`${BASE_URL}/wallet/balance`, authHeader));

  // 17. Wallet Add Money
  await testEndpoint('POST /api/wallet/add-money', () => axios.post(`${BASE_URL}/wallet/add-money`, { amount: 5000 }, authHeader));

  // 18. Wallet Transactions
  await testEndpoint('GET /api/wallet/transactions', () => axios.get(`${BASE_URL}/wallet/transactions`, authHeader));

  // 19. Transactions
  await testEndpoint('GET /api/transactions', () => axios.get(`${BASE_URL}/transactions`, authHeader));

  // 20. Payrant Virtual Account
  await testEndpoint('GET /api/payment/payrant/virtual-account', () => axios.get(`${BASE_URL}/payment/payrant/virtual-account`, authHeader));

  // 21. VTStack Virtual Account
  await testEndpoint('GET /api/payment/vtstack/virtual-account', () => axios.get(`${BASE_URL}/payment/vtstack/virtual-account`, authHeader));

  // 22. Notifications
  await testEndpoint('GET /api/notifications', () => axios.get(`${BASE_URL}/notifications`, authHeader));

  // 23. Mark all read
  await testEndpoint('PUT /api/notifications/read-all', () => axios.put(`${BASE_URL}/notifications/read-all`, {}, authHeader));

  // 24. Promotions
  await testEndpoint('GET /api/promotions', () => axios.get(`${BASE_URL}/promotions`));

  // 25. Promo Code validate
  await testEndpoint('POST /api/promotions/validate', () => axios.post(`${BASE_URL}/promotions/validate`, { code: 'PROMO5', amount: 1000 }));

  // 26. Referral Stats
  await testEndpoint('GET /api/referrals/stats', () => axios.get(`${BASE_URL}/referrals/stats`, authHeader));

  // 27. Support Ticket
  await testEndpoint('POST /api/support', () => axios.post(`${BASE_URL}/support`, { subject: 'Test question', message: 'Hello support' }, authHeader));

  // 28. Airtime to cash submit
  await testEndpoint('POST /api/airtime-to-cash/submit', () => axios.post(`${BASE_URL}/airtime-to-cash/submit`, { network: 'MTN', phone_number: '08100000000', amount: 1000 }, authHeader));

  // 29. Cable Verify
  await testEndpoint('POST /api/billpayment/cable/verify', () => axios.post(`${BASE_URL}/billpayment/cable/verify`, { provider: 'dstv', iucnumber: '1234567890' }, authHeader));

  // 30. Electricity Verify
  await testEndpoint('POST /api/billpayment/electricity/verify', () => axios.post(`${BASE_URL}/billpayment/electricity/verify`, { provider: 'ikeja-electric', meternumber: '1234567890' }, authHeader));

  // 31. Electricity Purchase
  await testEndpoint('POST /api/billpayment/electricity/purchase', () => axios.post(`${BASE_URL}/billpayment/electricity/purchase`, { provider: 'ikeja-electric', meternumber: '1234567890', amount: 2000, pin: '1234' }, authHeader));

  // 32. Exam Pin
  await testEndpoint('POST /api/billpayment/exampin', () => axios.post(`${BASE_URL}/billpayment/exampin`, { provider: 'waec', quantity: 1, pin: '1234' }, authHeader));

  // 33. Payment Initiate
  await testEndpoint('POST /api/payment/initiate', () => axios.post(`${BASE_URL}/payment/initiate`, { amount: 2000, gateway: 'payrant' }, authHeader));

  // 34. Admin Login
  const adminRes = await testEndpoint('POST /api/admin/login', () => axios.post(`${BASE_URL}/admin/login`, { email: 'murabusdatas@gmail.com', password: 'Murabus2026' }));
  const adminToken = adminRes?.data?.token;
  const adminHeader = { headers: { Authorization: `Bearer ${adminToken}` } };

  // 35. Admin Dashboard
  await testEndpoint('GET /api/admin/dashboard', () => axios.get(`${BASE_URL}/admin/dashboard`, adminHeader));

  // 36. Admin Users
  await testEndpoint('GET /api/admin/users', () => axios.get(`${BASE_URL}/admin/users`, adminHeader));

  // 37. Admin Audit Logs
  await testEndpoint('GET /api/admin/audit-logs', () => axios.get(`${BASE_URL}/admin/audit-logs`, adminHeader));

  console.log('\n========================================================');
  console.log(`Summary: ${pass} PASSED, ${fail} FAILED`);
  console.log('========================================================');

  process.exit(fail > 0 ? 1 : 0);
}

run();
