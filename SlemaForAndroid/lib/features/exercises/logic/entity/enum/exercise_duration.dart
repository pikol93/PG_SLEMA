enum ExerciseDuration {
  upTo15,
  upTo30,
  upTo60,
  upTo120,
  over120,
}

extension ExerciseDurationExtension on ExerciseDuration {
  static ExerciseDuration? fromDtoRepresentation(String value) {
    return ExerciseDuration.values
        .firstWhere((element) => value == element.dtoRepresentation);
  }

  String get dtoRepresentation {
    return toString();
  }

  String get labelTextRepresentation {
    switch (this) {
      case ExerciseDuration.upTo15:
        return "<15";
      case ExerciseDuration.upTo30:
        return "<30";
      case ExerciseDuration.upTo60:
        return "<60";
      case ExerciseDuration.upTo120:
        return "<120";
      case ExerciseDuration.over120:
        return "120+";
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }

  String get textRepresentation {
    switch (this) {
      case ExerciseDuration.upTo15:
        return "Do 15 minut";
      case ExerciseDuration.upTo30:
        return "Do 30 minut";
      case ExerciseDuration.upTo60:
        return "Do godziny";
      case ExerciseDuration.upTo120:
        return "Do dwóch godzin";
      case ExerciseDuration.over120:
        return "Powyżej dwóch godzin";
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }

  int get intRepresentation {
    switch (this) {
      case ExerciseDuration.upTo15:
        return 20;
      case ExerciseDuration.upTo30:
        return 40;
      case ExerciseDuration.upTo60:
        return 60;
      case ExerciseDuration.upTo120:
        return 80;
      case ExerciseDuration.over120:
        return 100;
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }
}

extension DoubleExerciseDurationExtension on double {
  ExerciseDuration toExerciseDuration() {
    if (this <= 0.2) {
      return ExerciseDuration.upTo15;
    } else if (this <= 0.4) {
      return ExerciseDuration.upTo30;
    } else if (this <= 0.6) {
      return ExerciseDuration.upTo60;
    } else if (this <= 0.8) {
      return ExerciseDuration.upTo120;
    } else {
      return ExerciseDuration.over120;
    }
  }
}
