import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String foo = dotenv.get('FOO');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.orange,
            Colors.white,
          ],
        ),
      ),
      child: Center(
        child: Column(
          children: [Text(foo)],
        ),
      ),
    );
  }
}
