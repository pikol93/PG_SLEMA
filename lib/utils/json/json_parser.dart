import 'package:flutter/material.dart';

class JsonParser {
  static TimeOfDay parseTimeOfDay(String value) {
    List<String> parts = value.split(":");
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  static T parseEnum<T>(String value, List<T> values) {
    return values.firstWhere((e) => e.toString() == value,
        orElse: () => throw Exception("Incorrect value"));
  }
}
