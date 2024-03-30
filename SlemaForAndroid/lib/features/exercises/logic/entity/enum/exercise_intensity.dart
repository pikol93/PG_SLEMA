import 'package:flutter/material.dart';
import 'package:pg_slema/theme/exercise_intensity_colors.dart';

enum ExerciseIntensity {
  veryGentle,
  gentle,
  moderate,
  intense,
  veryIntense,
}

extension DoubleDurationExtension on double {
  ExerciseIntensity toExerciseIntensity() {
    if (this <= 0.2) {
      return ExerciseIntensity.veryGentle;
    } else if (this <= 0.4) {
      return ExerciseIntensity.gentle;
    } else if (this <= 0.6) {
      return ExerciseIntensity.moderate;
    } else if (this <= 0.8) {
      return ExerciseIntensity.intense;
    } else {
      return ExerciseIntensity.veryIntense;
    }
  }
}

extension ExerciseDurationExtension on ExerciseIntensity {
  String get labelTextRepresentation {
    switch (this) {
      case ExerciseIntensity.veryGentle:
        return "Bardzo łagodny";
      case ExerciseIntensity.gentle:
        return "Łagodny";
      case ExerciseIntensity.moderate:
        return "Umiarkowany";
      case ExerciseIntensity.intense:
        return "Intensywny";
      case ExerciseIntensity.veryIntense:
        return "Bardzo intensywny";
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }

  String get textRepresentation {
    switch (this) {
      case ExerciseIntensity.veryGentle:
        return "Lekki i komfortowy ruch, który umożliwia swobodną rozmowę.";
      case ExerciseIntensity.gentle:
        return "Ruch wymagający nieco więcej wysiłku, ale nadal dość komfortowy.";
      case ExerciseIntensity.moderate:
        return "Umiarkowany ruch, który prowadzi do wyraźnego wzrostu tętna.";
      case ExerciseIntensity.intense:
        return "Ruch o wysokiej intensywności, prowadzący do uczucia zmęczenia.";
      case ExerciseIntensity.veryIntense:
        return "Bardzo wymagający ruch, który powoduje szybkie zmęczenie.";
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }

  int get intRepresentation {
    switch (this) {
      case ExerciseIntensity.veryGentle:
        return 20;
      case ExerciseIntensity.gentle:
        return 40;
      case ExerciseIntensity.moderate:
        return 60;
      case ExerciseIntensity.intense:
        return 80;
      case ExerciseIntensity.veryIntense:
        return 100;
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }

  Color? colorRepresentationLerp(double value) {
    switch (this) {
      case ExerciseIntensity.veryGentle:
        return Color.lerp(ExerciseIntensityColors.green,
            ExerciseIntensityColors.green, value);
      case ExerciseIntensity.gentle:
        return Color.lerp(ExerciseIntensityColors.green,
            ExerciseIntensityColors.green, value);
      case ExerciseIntensity.moderate:
        return Color.lerp(ExerciseIntensityColors.green,
            ExerciseIntensityColors.yellow, value);
      case ExerciseIntensity.intense:
        return Color.lerp(ExerciseIntensityColors.yellow,
            ExerciseIntensityColors.orange, value);
      case ExerciseIntensity.veryIntense:
        return Color.lerp(
            ExerciseIntensityColors.orange, ExerciseIntensityColors.red, value);
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }
}
