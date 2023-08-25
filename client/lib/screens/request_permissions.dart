import 'package:client/state/penny_provider.dart';
import 'package:client/utils/sms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestPermissionsScreen extends StatelessWidget {
  const RequestPermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Request Permissions'),
        onPressed: () async {
          SmsService().checkPermission().then((value) {
            Provider.of<PennyProvider>(context, listen: false)
                .setPermission(value!);
          });
        },
      ),
    );
  }
}
