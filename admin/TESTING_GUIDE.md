# 🧪 Admin Panel Testing Guide

Quick guide to test all features in the VTU Admin Panel.

---

## 🚀 Quick Start

### 1. Start Backend
```bash
cd VTUApp/backend
npm run dev
```
**Expected**: Server running on http://localhost:5000

### 2. Start Admin Panel
```bash
cd VTUApp/admin
npm run dev
```
**Expected**: Admin panel on http://localhost:5173

### 3. Login
- URL: http://localhost:5173/login
- Email: `admin@connectavtu.com`
- Password: `Admin@123456`

---

## ✅ Testing Checklist

### 🏠 Dashboard
- [ ] View total users count
- [ ] View active users count
- [ ] View total transactions
- [ ] View successful transactions
- [ ] Check if stats update on refresh

### 👥 Users Management
- [ ] View list of users
- [ ] Click "View" on a user
- [ ] Click "Edit" and update user info
- [ ] Click "Status" and change status
- [ ] Click "Delete" and confirm deletion
- [ ] Test pagination (Previous/Next)
- [ ] Try search functionality

### 💳 Transactions (NEW)
- [ ] View list of transactions
- [ ] Filter by status (Success/Pending/Failed)
- [ ] Filter by type (Airtime/Data/Electricity/Cable)
- [ ] Clear filters
- [ ] Test pagination
- [ ] Check transaction details display

### 💰 Pricing Plans
- [ ] View list of plans
- [ ] Filter by provider (MTN/Glo/Airtel/9mobile)
- [ ] Filter by type (AIRTIME/DATA)
- [ ] Click "Add Plan" and create new plan
- [ ] Click "View" on a plan
- [ ] Click "Edit" and update plan
- [ ] Click "Delete" and confirm
- [ ] Click "Bulk Import" and test import
- [ ] Test pagination

### 💵 Wallet Credit
- [ ] Select a user from dropdown
- [ ] Enter amount (e.g., 1000)
- [ ] Enter description
- [ ] Review summary
- [ ] Click "Credit Wallet"
- [ ] Verify success message
- [ ] Check if form resets

### 📋 Audit Logs
- [ ] View list of audit logs
- [ ] Check if recent actions appear
- [ ] Click "Delete" on a log
- [ ] Confirm deletion
- [ ] Test pagination

### ⚙️ Profile
- [ ] View profile information
- [ ] Check if admin details display
- [ ] (Password change not yet functional)

### 🔐 Logout
- [ ] Click "Logout" in sidebar
- [ ] Verify redirect to login page
- [ ] Try accessing protected page (should redirect to login)

---

## 🎯 Feature-Specific Tests

### User Management Deep Dive
1. **Create/Edit User**:
   - Update first name: "Test"
   - Update last name: "User"
   - Update email: "test@example.com"
   - Update phone: "+2348012345678"
   - Change status: "Active" → "Suspended"
   - Change KYC: "Pending" → "Verified"
   - Save and verify changes

2. **Status Update**:
   - Select user
   - Change to "Suspended"
   - Verify badge color changes
   - Check audit log for action

3. **Delete User**:
   - Select user
   - Click delete
   - Read warning message
   - Confirm deletion
   - Verify user removed from list

### Pricing Plans Deep Dive
1. **Create Plan**:
   - Provider: MTN (1)
   - Name: "MTN 1GB Data"
   - Price: 500
   - Type: DATA
   - Discount: 5
   - Active: Yes
   - Save and verify

2. **Bulk Import**:
   - Click "Bulk Import"
   - Use sample JSON:
   ```json
   [
     {
       "providerId": 1,
       "providerName": "MTN",
       "name": "MTN 100 Airtime",
       "price": 100,
       "type": "AIRTIME",
       "discount": 0,
       "active": true
     }
   ]
   ```
   - Import and verify

3. **Filter Plans**:
   - Select Provider: MTN
   - Select Type: AIRTIME
   - Verify filtered results
   - Clear filters
   - Verify all plans show

### Wallet Credit Deep Dive
1. **Credit Wallet**:
   - Select user: "John Doe"
   - Amount: 5000
   - Description: "Test credit for promotional campaign"
   - Review summary
   - Credit wallet
   - Verify success message
   - Check audit logs for entry

### Transactions Deep Dive (NEW)
1. **View Transactions**:
   - Check transaction list loads
   - Verify user info displays
   - Check amount formatting
   - Verify status badges

2. **Filter Transactions**:
   - Filter by Status: "Success"
   - Verify only successful transactions show
   - Filter by Type: "Airtime"
   - Verify only airtime transactions show
   - Clear filters
   - Verify all transactions show

---

## 🐛 Common Issues & Solutions

### Issue: "Failed to load users"
**Solution**: 
- Check backend is running
- Verify MongoDB connection
- Check network tab for API errors

### Issue: "Invalid credentials"
**Solution**:
- Verify admin user exists in database
- Run: `cd backend && npx tsx scripts/create-admin.ts`
- Use correct credentials

### Issue: "Token expired"
**Solution**:
- Logout and login again
- Token expires after 24 hours

### Issue: "Cannot read property of undefined"
**Solution**:
- Check API response structure
- Verify backend is returning correct data format

---

## 📊 Expected Results

### Dashboard Stats
- Total Users: Should match database count
- Active Users: Should match active status count
- Total Transactions: Should match all transactions
- Successful Transactions: Should match success status

### User List
- Should show 10 users per page
- Pagination should work
- Status badges should be color-coded
- Actions should be clickable

### Transaction List (NEW)
- Should show 20 transactions per page
- Filters should work correctly
- Status and type badges should be color-coded
- User information should display

### Pricing Plans
- Should show 10 plans per page
- Filters should work
- Create/Edit should save correctly
- Bulk import should process all plans

### Wallet Credit
- Should credit user wallet
- Should create audit log entry
- Should show success message
- Form should reset after success

### Audit Logs
- Should show all admin actions
- Should display admin info
- Should show timestamps
- Delete should work

---

## 🎯 Performance Tests

### Load Time
- Dashboard should load < 2 seconds
- User list should load < 3 seconds
- Transaction list should load < 3 seconds
- Pricing plans should load < 2 seconds

### Pagination
- Next/Previous should be instant
- No lag when switching pages
- Data should load smoothly

### Filters
- Filters should apply instantly
- No delay in filtering
- Clear filters should reset immediately

---

## ✅ Success Criteria

All features pass when:
- ✅ All pages load without errors
- ✅ All API calls succeed
- ✅ All CRUD operations work
- ✅ All filters work correctly
- ✅ All modals open and close
- ✅ All forms validate correctly
- ✅ All success messages display
- ✅ All error messages display
- ✅ Pagination works on all pages
- ✅ Logout works correctly

---

## 📝 Test Report Template

```
Date: ___________
Tester: ___________

Dashboard: ☐ Pass ☐ Fail
Users: ☐ Pass ☐ Fail
Transactions: ☐ Pass ☐ Fail
Pricing: ☐ Pass ☐ Fail
Wallet Credit: ☐ Pass ☐ Fail
Audit Logs: ☐ Pass ☐ Fail
Profile: ☐ Pass ☐ Fail
Login/Logout: ☐ Pass ☐ Fail

Issues Found:
1. ___________
2. ___________
3. ___________

Overall Status: ☐ Pass ☐ Fail
```

---

## 🎉 Happy Testing!

If all tests pass, the admin panel is ready for production! 🚀
