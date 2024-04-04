import 'package:flutter/material.dart';
import 'package:pg_slema/utils/data/dto.dart';

class ExerciseDto with Dto {
  @override
  final String id;
  final String name;
  final int intensity;
  final int exerciseDuration;
  final DateTime exerciseDate;
  final TimeOfDay exerciseTime;

  ExerciseDto(this.id, this.name, this.intensity, this.exerciseDuration,
      this.exerciseDate, this.exerciseTime);
}
