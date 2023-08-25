import 'package:client/state/penny_provider.dart';
import 'package:client/utils/sms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestPermissionsScreen extends StatelessWidget {
  const RequestPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              'Penny needs permission to read your messages.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'This is so that Penny can read your M-PESA messages and help you keep track of your spending.',
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              child: const Text('Request Permissions'),
              onPressed: () async {
                SmsService().checkPermission().then((value) {
                  Provider.of<PennyProvider>(context, listen: false)
                      .setPermission(value!);
                });
              },
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
