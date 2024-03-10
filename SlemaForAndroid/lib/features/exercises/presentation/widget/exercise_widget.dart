import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;

  const ExerciseWidget({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.red,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exercise.name,
          ),
          const SizedBox(height: 8.0),
          Text(exercise.intensity.toString()),
          Text(exercise.exerciseDuration.toString()),
          const SizedBox(height: 8.0),
          Text(exercise.exerciseTime.toString()),
          const SizedBox(height: 8.0),
          Text(exercise.exerciseDate.toString()),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
