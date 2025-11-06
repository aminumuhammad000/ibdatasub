# Registration Debugging Guide

## Problem Fixed
The registration was failing because React Native cannot connect to `localhost:5000` when running on an emulator or physical device.

## Changes Made

### 1. Updated API Configuration (`frontend/services/api.ts`)
- **Android Emulator**: Now uses `http://10.0.2.2:5000/api` (Android emulator's special IP for host machine)
- **iOS Simulator**: Uses `http://localhost:5000/api`
- **Added Console Logging**: All API requests and responses are now logged to help debug issues

### 2. Enhanced Error Handling (`frontend/services/auth.service.ts`)
- Added detailed console logging for registration attempts
- Better error messages that show the actual backend error

## How to Test

### Step 1: Verify Backend is Running
```bash
cd backend
# Check if the server is running (you should see it on port 5000)
ps aux | grep node | grep server.ts

# Test the backend directly
curl -X POST http://localhost:5000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","phone_number":"08012345678","password":"Password123","first_name":"Test","last_name":"User"}'
```

### Step 2: Check MongoDB Connection
Make sure MongoDB is running and the backend connected successfully. Check the backend terminal for:
- ✅ MongoDB connected successfully
- ✅ Server running on http://localhost:5000

### Step 3: Run the Frontend
```bash
cd frontend
npx expo start
```

### Step 4: Test Registration
1. Open the app on your emulator/device
2. Go to the signup screen
3. Fill in the registration form:
   - First Name: Test
   - Last Name: User
   - Email: test@example.com
   - Phone: 08012345678 (or any 10-15 digit number)
   - Password: Password123 (must be at least 8 characters)
   - Confirm Password: Password123

4. Check the console logs:
   - Metro bundler console (terminal where `npx expo start` is running)
   - Backend console (terminal where backend is running)

## Expected Console Output

### Frontend Console (Metro Bundler)
```
🌐 API Base URL: http://10.0.2.2:5000/api  (for Android)
🔵 API Request: POST http://10.0.2.2:5000/api/auth/register
📤 Sending registration request to backend: {email: "test@example.com", ...}
✅ API Response: POST /auth/register - Status: 201
✅ Registration response: {success: true, message: "Registration successful", ...}
```

### Backend Console
You should see the registration request being processed

## Common Issues & Solutions

### Issue 1: "Network Error: No response received"
**Cause**: Backend server is not running or not accessible
**Solution**: 
- Make sure backend is running: `cd backend && npm run dev`
- Check if port 5000 is being used: `lsof -i :5000`

### Issue 2: "Cannot connect to localhost:5000"
**Cause**: Using wrong API URL for the platform
**Solution**: The fix we implemented should handle this automatically
- Android: Uses `10.0.2.2:5000`
- iOS: Uses `localhost:5000`

### Issue 3: Validation errors (e.g., "phone_number is required")
**Cause**: Form fields not matching backend requirements
**Solution**: Ensure all required fields are filled:
- Email must be valid format
- Phone number must be 10-15 digits
- Password must be at least 8 characters
- First name and last name are required

### Issue 4: "User already exists"
**Cause**: Email or phone number already registered
**Solution**: Use different email/phone or check the database

## For Physical Device Testing

If testing on a physical device connected to the same WiFi:

1. Find your computer's IP address:
```bash
hostname -I | awk '{print $1}'
# Example output: 192.168.0.147
```

2. Update `frontend/services/api.ts`:
```typescript
const getApiUrl = () => {
  if (Platform.OS === 'android') {
    return 'http://192.168.0.147:5000/api'; // Use your actual IP
  }
  return 'http://192.168.0.147:5000/api'; // Use your actual IP for iOS too
};
```

3. Make sure your backend allows connections from your network:
   - Backend should listen on `0.0.0.0` not just `localhost`

## Debugging Checklist

- [ ] Backend server is running on port 5000
- [ ] MongoDB is connected
- [ ] Frontend is using correct API URL for platform
- [ ] Console logs are visible in Metro bundler
- [ ] Registration form has all required fields filled
- [ ] Phone number format is correct (10-15 digits)
- [ ] Password is at least 8 characters
- [ ] Email format is valid
- [ ] Email and phone are not already registered

## Additional Logging

To see detailed request/response data, check:
1. **Metro Bundler Terminal**: Frontend logs with 🔵, ✅, and ❌ icons
2. **Backend Terminal**: Server logs showing incoming requests
3. **React Native Debugger** (if installed): Network tab for detailed API calls

## Still Having Issues?

Check these logs in order:
1. Frontend console for API request errors
2. Backend console for server errors
3. MongoDB logs for database connection issues

Run this to test backend directly:
```bash
cd backend
curl http://localhost:5000/health
# Should return: {"status":"ok","message":"Server is running"}
```
