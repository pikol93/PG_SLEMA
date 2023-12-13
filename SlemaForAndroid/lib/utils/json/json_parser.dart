import 'package:flutter/material.dart';

class JsonParser {
  static TimeOfDay parseTimeOfDayFromJson(String value) {
    List<String> parts = value.split(":");
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  static T parseEnumFromJson<T>(String value, List<T> values) {
    return values.firstWhere((e) => e.toString() == value,
        orElse: () => throw Exception("Incorrect value"));
  }

  static String parseEnumToJson<T>(T value) {
    return value.toString();
  }

  static String parseTimeOfDayToJson(TimeOfDay time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}
