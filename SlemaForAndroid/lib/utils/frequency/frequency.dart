enum Frequency { singular, daily, everyXDays }

extension FrequencyExtension on Frequency {
  String get name {
    switch (this) {
      case Frequency.singular:
        return 'Jednorazowo';
      case Frequency.daily:
        return 'Codziennie';
      case Frequency.everyXDays:
        return 'Co X dni';
    }
  }
}
