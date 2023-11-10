import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';

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
            children: const [
              ExerciseWidget(
                  exerciseName: "Podciąganie",
                  series: "1/3",
                  repetitions: "5",
                  weight: "-15kg"),
              SizedBox(
                height: 10,
              ),
              ExerciseWidget(
                  exerciseName: "Brzuszki",
                  series: "3/7",
                  repetitions: "15",
                  weight: "+5kg")
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
