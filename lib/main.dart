import 'package:flutter/material.dart';
import 'package:pg_slema/main_screen.dart';


void main() {
  runApp(const SLEMA());
}

class SLEMA extends StatelessWidget {
  const SLEMA({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}
