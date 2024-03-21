import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';

class AddExerciseScreen extends StatefulWidget {
  final ValueChanged<Exercise> onExerciseAdded;
  const AddExerciseScreen({super.key, required this.onExerciseAdded});

  @override
  State<StatefulWidget> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DefaultAppBar(title: "Dodaj ćwiczenie"),
      ],
    );
  }
}
