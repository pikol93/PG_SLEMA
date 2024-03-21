import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:uuid/uuid.dart';

class AddExerciseController {
  String _exerciseId = const Uuid().v4();
  String name = "";
  int intensity = 50;
  int exerciseDuration = 0;
  DateTime exerciseDate = DateTime.now();
  TimeOfDay exerciseTime = TimeOfDay.now();

  void initFromExercise(Exercise exercise) {
    _exerciseId = exercise.id;
    name = exercise.name;
    intensity = exercise.intensity;
    exerciseDuration = exercise.exerciseDuration;
    exerciseDate = exercise.exerciseDate;
    exerciseTime = exercise.exerciseTime;
  }

  Exercise createExercise() {
    return Exercise(_exerciseId, name, intensity, exerciseDuration,
        exerciseDate, exerciseTime);
  }
}
