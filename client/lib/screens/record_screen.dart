import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Record Screen'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Placeholder(),
      ),
    );
  }
}
