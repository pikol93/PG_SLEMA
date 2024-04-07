import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_duration.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_intensity.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise_dto.dart';

class ExerciseToDtoConverter {
  Exercise fromDto(ExerciseDto dto) {
    return Exercise(
      dto.id,
      dto.name,
      ExerciseIntensityExtension.fromDtoRepresentation(dto.intensity)!,
      ExerciseDurationExtension.fromDtoRepresentation(dto.exerciseDuration)!,
      dto.exerciseDate,
      dto.exerciseTime,
    );
  }

  ExerciseDto toDto(Exercise exercise) {
    return ExerciseDto(
        exercise.id,
        exercise.name,
        exercise.intensity.dtoRepresentation,
        exercise.exerciseDuration.dtoRepresentation,
        exercise.exerciseDate,
        exercise.exerciseTime);
  }
}
