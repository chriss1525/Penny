import 'package:client/cards/records.dart';
import 'package:client/state/penny_provider.dart';
import 'package:client/utils/sms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SmsService().getAllMessages().then((value) {
      Provider.of<PennyProvider>(context, listen: false).setMessages(value);
    });

    return const Column(
      children: [
        Records(),
      ],
    );
  }
}
