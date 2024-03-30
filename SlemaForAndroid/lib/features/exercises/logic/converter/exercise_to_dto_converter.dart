import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise_dto.dart';

class ExerciseToDtoConverter {
  Exercise fromDto(ExerciseDto dto) {
    return Exercise(dto.id, dto.name, dto.intensity, dto.exerciseDuration,
        dto.exerciseDate, dto.exerciseTime);
  }

  ExerciseDto toDto(Exercise exercise) {
    return ExerciseDto(
        exercise.id,
        exercise.name,
        exercise.intensity,
        exercise.exerciseDuration,
        exercise.exerciseDate,
        exercise.exerciseTime);
  }
}
