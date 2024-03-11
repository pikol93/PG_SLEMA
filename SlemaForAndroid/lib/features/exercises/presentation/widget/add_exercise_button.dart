import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/presentation/screen/add_exercise_screen.dart';

class AddExerciseButton extends StatelessWidget {
  final ValueChanged<Exercise> onExerciseAdded;

  const AddExerciseButton({super.key, required this.onExerciseAdded});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AddExerciseScreen(onExerciseAdded: onExerciseAdded)));
      },
      child: const Icon(Icons.add),
    );
  }
}
