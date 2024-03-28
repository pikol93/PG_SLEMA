import 'dart:ui';

import 'package:pg_slema/theme/medicine_frequency_colors.dart';

enum Frequency { singular, daily }

extension FrequencyExtension on Frequency {
  String get name {
    switch (this) {
      case Frequency.singular:
        return 'Jednorazowo';
      case Frequency.daily:
        return 'Codziennie';
    }
  }

  Color get colorFrequencyRepresentation {
    switch (this) {
      case Frequency.daily:
        return MedicineFrequencyColors.yellow;
      case Frequency.singular:
        return MedicineFrequencyColors.green;
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }
}
