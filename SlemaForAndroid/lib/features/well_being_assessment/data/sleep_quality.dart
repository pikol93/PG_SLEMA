import 'package:flutter/material.dart';

enum SleepQuality {
  awful,
  bad,
  neutral,
  good,
  great,
}

extension SleepQualityExtension on SleepQuality {
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
        return Colors.redAccent;
      case SleepQuality.bad:
        return Colors.orangeAccent;
      case SleepQuality.neutral:
        return Colors.yellowAccent;
      case SleepQuality.good:
        return Colors.greenAccent;
      case SleepQuality.great:
        return Colors.blueAccent;
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }
}
