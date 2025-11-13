# ⚡ Quick Start Guide - VTU Admin Panel

Get up and running in 2 minutes!

---

## 🚀 Start in 3 Steps

### Step 1: Start Backend
```bash
cd VTUApp/backend
npm run dev
```
✅ Backend running on http://localhost:5000

### Step 2: Start Admin Panel
```bash
cd VTUApp/admin
npm run dev
```
✅ Admin panel on http://localhost:5173

### Step 3: Login
- Open: http://localhost:5173
- Email: `admin@connectavtu.com`
- Password: `Admin@123456`

---

## 🎯 What You Can Do

### 1. Dashboard
View platform statistics and metrics

### 2. Users
- View all users
- Edit user details
- Change user status
- Delete users

### 3. Transactions (NEW)
- Monitor all transactions
- Filter by status/type
- View transaction details

### 4. Pricing Plans
- Manage pricing plans
- Create/Edit/Delete plans
- Bulk import plans

### 5. Wallet Credit
- Credit user wallets
- Add funds to any user

### 6. Audit Logs
- View all admin actions
- Track changes

---

## 📱 Pages Available

| Page | URL | Description |
|------|-----|-------------|
| Dashboard | `/dashboard` | Statistics overview |
| Users | `/users` | User management |
| Transactions | `/transactions` | Transaction monitoring |
| Pricing | `/pricing` | Pricing management |
| Wallet Credit | `/wallet-credit` | Credit wallets |
| Audit Logs | `/audit-logs` | Action tracking |
| Profile | `/profile` | Admin profile |

---

## 🔧 Troubleshooting

### Backend not starting?
```bash
cd VTUApp/backend
npm install
npm run dev
```

### Admin panel not starting?
```bash
cd VTUApp/admin
npm install
npm run dev
```

### Can't login?
Create admin user:
```bash
cd VTUApp/backend
npx tsx scripts/create-admin.ts
```

---

## 📚 More Documentation

- **COMPLETE_FEATURE_LIST.md** - All features
- **TESTING_GUIDE.md** - Testing instructions
- **ADMIN_FINAL_SUMMARY.md** - Implementation summary

---

## ✅ That's It!

You're ready to use the admin panel! 🎉
