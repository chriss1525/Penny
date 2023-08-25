import 'package:client/state/penny_provider.dart';
import 'package:client/utils/sms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestPermissionScreen extends StatelessWidget {
  // TODO: implement flow to request permissions. Multiple horizontal screens explaining why we need permissions and how Penny works
  // TODO: implement authentication screen
  // TODO: implement sync screen, where transactions are retrieved from db
  const RequestPermissionScreen({super.key});

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
              child: const Text('Grant Permissions'),
              onPressed: () async {
                // request sms permissions
                SmsService().checkPermission().then((value) {
                  Provider.of<PennyProvider>(context, listen: false)
                      .setPermission(value!);
                });

                // get all messages
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
