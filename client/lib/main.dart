import 'package:client/screens/request_permissions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telephony/telephony.dart';

import 'state/penny_provider.dart';

onBackgroundMessage(SmsMessage message) {
  if (kDebugMode) {
    print('onBackgroundMessage called');
  }

  if (kDebugMode) {
    print(message.body);
  }
}

void main() => runApp(const PennyApp());

class PennyApp extends StatelessWidget {
  const PennyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PennyProvider(),
      child: MaterialApp(
        title: 'Penny',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penny'),
        // get appropriate color from theme
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      body: Provider.of<PennyProvider>(context).hasPermission
          ? const Placeholder()
          : const RequestPermissionsScreen(),
    );
  }
}
