import 'package:client/screens/login.dart';
import 'package:client/screens/onboarding.dart';
import 'package:client/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isOnboarded = prefs.getBool('isOnboarded') ?? false;

  return runApp(
    PennyApp(isOnboarded: isOnboarded),
  );
}

class PennyApp extends StatelessWidget {
  final bool isOnboarded;

  const PennyApp({
    super.key,
    required this.isOnboarded,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Penny',
        home: Scaffold(
          body: !isOnboarded ? const Onboarding() : const LoginScreen(),
        ),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
