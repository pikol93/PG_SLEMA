import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/presentation/widget/add_exercise_button.dart';
import 'package:pg_slema/features/exercises/presentation/widget/all_exercises_widget.dart';
import 'package:pg_slema/features/exercises/presentation/controller/exercises_controller.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<StatefulWidget> createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  late final AllExercisesController _controller;

  ExercisesScreenState() {
    _controller = AllExercisesController(_onExercisesChanged);
    super.initState();
    _controller.initializeExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllExercisesWidget(exercises: _controller.exercises),
      floatingActionButton:
          AddExerciseButton(onExerciseAdded: _controller.onExerciseCreated),
    );
  }

  void _onExercisesChanged() {
    setState(() {});
  }
}
