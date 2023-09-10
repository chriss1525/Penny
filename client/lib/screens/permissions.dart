import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

class Permissions extends StatelessWidget {
  const Permissions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grant Permissions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Penny needs to read your MPESA messages.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              'In order to automatically record your transaction, Penny reads your incoming and available MPESA messages.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Penny only reads your MPESA messages and doesn\'t read other messages.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 48.0,
            ),
            ElevatedButton(
              onPressed: () async {
                bool? permissionGranted =
                    await Telephony.instance.requestSmsPermissions;

                SharedPreferences prefs = await SharedPreferences.getInstance();

                await prefs.setBool(
                    'permissionGranted', permissionGranted ?? false);

                if (permissionGranted != null && permissionGranted) {
                  if (!context.mounted) return;
                  Navigator.pushNamed(context, '/home');
                } else {}
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Grant Permissions'),
            )
          ],
        ),
      ),
    );
  }
}
