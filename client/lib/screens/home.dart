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
      body: const Column(
        children: <Widget>[
          Records(),
        ],
      ),
    );
  }
}
