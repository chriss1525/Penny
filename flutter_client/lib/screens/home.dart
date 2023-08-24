import 'package:flutter/material.dart';
import 'package:penny/utils/sms.dart';
import 'package:provider/provider.dart';

import '../states/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penny'),
      ),
      body: const Center(
        child: HomeContainer(),
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeText(),
        const HomeButton(),
      ],
    );
  }
}

class HomeText extends StatelessWidget {
  const HomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Welcome to Penny.\n\nPenny needs your permission to read SMS messages.\n',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        SmsService().hasPermission().then((value) {
          Provider.of<MyAppState>(context, listen: false).setPermission(value!);
        });
      },
      child: const Text('Grant Permission'),
    );
  }
}
