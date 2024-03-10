import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';

class ExerciseWidget extends StatefulWidget {
  final Exercise exercise;

  const ExerciseWidget({super.key, required this.exercise});

  @override
  ExerciseWidgetState createState() => ExerciseWidgetState();
}

class ExerciseWidgetState extends State<ExerciseWidget> {
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
            widget.exercise.name,
          ),
          const SizedBox(height: 8.0),
          Text(widget.exercise.intensity as String),
          Text(widget.exercise.exerciseDuration as String),
          const SizedBox(height: 8.0),
          Text(widget.exercise.exerciseTime as String),
          const SizedBox(height: 8.0),
          Text(widget.exercise.exerciseDate as String),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
