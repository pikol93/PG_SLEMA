import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_duration.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_intensity.dart';

class Exercise {
  static const String exerciseListSharedPrefKey = 'exercises';
  final String id;
  final String name;
  final ExerciseIntensity intensity;
  final ExerciseDuration exerciseDuration;
  final DateTime exerciseDate;
  final TimeOfDay exerciseTime;

  Exercise(this.id, this.name, this.intensity, this.exerciseDuration,
      this.exerciseDate, this.exerciseTime);
}
