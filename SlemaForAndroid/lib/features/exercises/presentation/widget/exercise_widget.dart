import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercise exercise;

  const ExerciseWidget({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Text(exercise.name),
          const SizedBox(height: 8.0),
          Text(exercise.intensity.toString()),
          const SizedBox(height: 8.0),
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
