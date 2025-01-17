import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOME',
      home: Scaffold(
        appBar: AppBar(title: const Text('HOME'),),
        body: const Center(
          child: Text('HOME CONTENT'),
        ),
      ),
    );
  }
}
