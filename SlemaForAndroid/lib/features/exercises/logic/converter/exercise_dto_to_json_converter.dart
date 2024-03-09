import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class ExerciseDtoToJsonConverter
    with CustomConverter<ExerciseDto, Map<String, dynamic>> {
  @override
  ExerciseDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(ExerciseDto t) {
    return _toJson(t);
  }

  ExerciseDto _fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    String exerciseDate = json['exerciseDate'] ?? DateTime.now().toString();
    TimeOfDay exerciseTime = _getExerciseTime(json);
    return ExerciseDto(
        json['id'],
        json['name'] ?? '',
        json['intensity'] ?? 50,
        json['exerciseDuration'] ?? 0,
        DateTime.parse(exerciseDate),
        exerciseTime);
  }

  Map<String, dynamic> _toJson(ExerciseDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        'intensity': dto.intensity.toString(),
        'exerciseDuration': dto.exerciseDuration.toString(),
        'exerciseDate': dto.exerciseDate.toString(),
        'exerciseTime': JsonParser.parseTimeOfDayToJson(dto.exerciseTime),
      };

  TimeOfDay _getExerciseTime(Map<String, dynamic> json) {
    if (json.containsKey('exerciseTime')) {
      return JsonParser.parseTimeOfDayFromJson(json['exerciseTime']);
    }
    return const TimeOfDay(hour: 0, minute: 0);
  }
}
