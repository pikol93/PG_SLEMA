import 'package:flutter/material.dart';

class Exercise {
  static const String exerciseListSharedPrefKey = 'exercises';
  final String id;
  final String name;
  final int intensity;
  final int exerciseDuration;
  final DateTime exerciseDate;
  final TimeOfDay exerciseTime;

  Exercise(this.id, this.name, this.intensity, this.exerciseDuration,
      this.exerciseDate, this.exerciseTime);
}
