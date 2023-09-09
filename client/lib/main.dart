import 'package:client/screens/auth/login.dart';
import 'package:client/screens/auth/reset-password.dart';
import 'package:client/screens/home.dart';
import 'package:client/screens/onboarding.dart';
import 'package:client/screens/auth/register.dart';
import 'package:client/screens/record_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isOnboarded = prefs.getBool('isOnboarded') ?? false;
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  return runApp(
    PennyApp(
      isOnboarded: isOnboarded,
      isLoggedIn: isLoggedIn,
    ),
  );
}

class PennyApp extends StatelessWidget {
  final bool isOnboarded;
  final bool isLoggedIn;

  const PennyApp({
    super.key,
    required this.isOnboarded,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Penny',
        home: Scaffold(
          body: isOnboarded
              ? isLoggedIn
                  ? const Home()
                  : const LoginScreen()
              : const Onboarding(),
        ),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/reset-password': (context) => const ResetPasswordScreen(),
          '/onboarding': (context) => const Onboarding(),
          '/home': (context) => const Home(),
          '/record': (context) => const RecordScreen(),
        },
      ),
    );
  }
}
