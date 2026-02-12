import 'package:flutter/material.dart';
import 'screens/game_screen.dart';

void main() {
  runApp(const BrajDham());
}

class BrajDham extends StatelessWidget {
  const BrajDham({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}
