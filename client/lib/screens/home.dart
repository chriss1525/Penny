import 'package:client/cards/records.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penny'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Sync your MPESA messages',
        onPressed: () {},
        child: const Icon(Icons.sync),
      ),
      body: const Column(
        children: <Widget>[
          Records(),
        ],
      ),
    );
  }
}
