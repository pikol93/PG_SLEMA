import 'package:flutter/material.dart';

class JsonParser {
  static TimeOfDay parseTimeOfDayFromJson(String value) {
    List<String> parts = value.split(":");
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  /// Throws ArgumentError when jsonKey is null or doesn't match to any enum toString
  static T parseEnumFromJson<T>(String? jsonKey, List<T> possibleValues) {
    if (jsonKey == null) {
      throw ArgumentError("Enum string can't be null");
    }

    return possibleValues.firstWhere((e) => e.toString() == jsonKey,
        orElse: () => (throw ArgumentError("Incorrect enum string")));
  }

  static String parseEnumToJson<T>(T value) {
    return value.toString();
  }

  static String parseTimeOfDayToJson(TimeOfDay time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}
