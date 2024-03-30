import 'package:flutter/material.dart';

extension TimeOfDayComparators on TimeOfDay {
  bool isHigher(TimeOfDay other) {
    if (hour < other.hour) return false;
    if (hour > other.hour) return true;
    if (minute > other.minute) return true;
    return false;
  }
}
