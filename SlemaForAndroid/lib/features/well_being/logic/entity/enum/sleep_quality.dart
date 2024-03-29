import 'package:flutter/material.dart';

enum SleepQuality {
  awful,
  bad,
  neutral,
  good,
  great,
}

extension SleepQualityExtension on SleepQuality {
  static SleepQuality from(String text) {
    return SleepQuality.values.firstWhere(
      (element) => element.name == text,
      orElse: () => SleepQuality.neutral,
    );
  }

  String get buttonTextRepresentation {
    switch (this) {
      case SleepQuality.awful:
        return "1";
      case SleepQuality.bad:
        return "2";
      case SleepQuality.neutral:
        return "3";
      case SleepQuality.good:
        return "4";
      case SleepQuality.great:
        return "5";
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }

  String get buttonSubtitleTextRepresentation {
    switch (this) {
      case SleepQuality.awful:
        return "Okropny";
      case SleepQuality.bad:
        return "Słaby";
      case SleepQuality.neutral:
        return "OK";
      case SleepQuality.good:
        return "Dobry";
      case SleepQuality.great:
        return "Świetny";
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }

  Color get colorRepresentation {
    switch (this) {
      case SleepQuality.awful:
        return Colors.redAccent.shade100;
      case SleepQuality.bad:
        return Colors.orangeAccent.shade100;
      case SleepQuality.neutral:
        return Colors.yellowAccent.shade100;
      case SleepQuality.good:
        return Colors.greenAccent.shade100;
      case SleepQuality.great:
        return Colors.blueAccent.shade100;
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }
}
