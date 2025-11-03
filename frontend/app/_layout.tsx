import { Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';

export default function RootLayout() {
  return (
    <>
      <StatusBar style="light" />
      <Stack>
        <Stack.Screen 
          name="index" 
          options={{
            headerShown: false,
          }}
        />
        <Stack.Screen 
          name="login" 
          options={{
            headerShown: false,
            presentation: 'modal',
          }}
        />
        <Stack.Screen 
          name="signup" 
          options={{
            headerShown: false,
            presentation: 'modal',
          }}
        />
        <Stack.Screen 
          name="(tabs)" 
          options={{
            headerShown: false,
          }}
        />
        <Stack.Screen 
          name="modal" 
          options={{
            presentation: 'modal',
          }}
        />
      </Stack>
      <StatusBar style="auto" />
    </>
  );
}
