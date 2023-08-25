import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/penny_provider.dart';

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
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penny'),
        // get appropriate color from theme
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      body: const Center(
        child: Text('Hello, world!'),
      ),
    );
  }
}
