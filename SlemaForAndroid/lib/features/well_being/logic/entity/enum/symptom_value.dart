import 'package:flutter/material.dart';

enum SymptomValue {
  none,
  mild,
  moderate,
  intense,
  terrible,
}

extension SymptomValueExtension on SymptomValue {
  static SymptomValue from(String text) {
    return SymptomValue.values.firstWhere(
      (element) => element.name == text,
      orElse: () => SymptomValue.moderate,
    );
  }

  String get textRepresentation {
    switch (this) {
      case SymptomValue.none:
        return "Brak";
      case SymptomValue.mild:
        return "Łagodne";
      case SymptomValue.moderate:
        return "Umiarkowane";
      case SymptomValue.intense:
        return "Intensywne";
      case SymptomValue.terrible:
        return "Okropne";
    }
  }

  Color get colorRepresentation {
    switch (this) {
      case SymptomValue.none:
        return Colors.white;
      case SymptomValue.mild:
        return Colors.greenAccent;
      case SymptomValue.moderate:
        return Colors.yellowAccent;
      case SymptomValue.intense:
        return Colors.orangeAccent;
      case SymptomValue.terrible:
        return Colors.redAccent;
    }
  }

  double get valueRepresentation {
    switch (this) {
      case SymptomValue.none:
        return 0.0;
      case SymptomValue.mild:
        return 0.25;
      case SymptomValue.moderate:
        return 0.5;
      case SymptomValue.intense:
        return 0.75;
      case SymptomValue.terrible:
        return 1.0;
    }
  }

  SymptomValue get increased {
    switch (this) {
      case SymptomValue.none:
        return SymptomValue.mild;
      case SymptomValue.mild:
        return SymptomValue.moderate;
      case SymptomValue.moderate:
        return SymptomValue.intense;
      case SymptomValue.intense:
        return SymptomValue.terrible;
      case SymptomValue.terrible:
        return SymptomValue.terrible;
    }
  }

  SymptomValue get decreased {
    switch (this) {
      case SymptomValue.none:
        return SymptomValue.none;
      case SymptomValue.mild:
        return SymptomValue.none;
      case SymptomValue.moderate:
        return SymptomValue.mild;
      case SymptomValue.intense:
        return SymptomValue.moderate;
      case SymptomValue.terrible:
        return SymptomValue.moderate;
    }
  }
}
