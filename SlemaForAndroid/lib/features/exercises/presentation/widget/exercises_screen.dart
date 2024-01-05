import 'package:flutter/material.dart';
import 'package:pg_slema/features/picture/presentation/widget/pick_image.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  ExercisesScreenState createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              PickImage(),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: Container(
              margin: const EdgeInsets.only(top: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.edit_calendar, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
