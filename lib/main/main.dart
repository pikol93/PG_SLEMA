import 'package:flutter/material.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/motivation/controller/motivation_screen_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenController()),
        ChangeNotifierProvider(create: (context) => MotivationScreenController()),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    ),
  );
}