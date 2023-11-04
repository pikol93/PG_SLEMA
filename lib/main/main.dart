import 'package:flutter/material.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => MainScreenController(),
        child: MainScreen(),
      ),
    ),
  );
}