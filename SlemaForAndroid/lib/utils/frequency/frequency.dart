enum Frequency { singular, daily, everyTwoDays, everyThreeDays }

extension FrequencyExtension on Frequency {
  String get name {
    switch (this) {
      case Frequency.singular:
        return 'Jednorazowo';
      case Frequency.daily:
        return 'Codziennie';
      case Frequency.everyTwoDays:
        return 'Co dwa dni';
      case Frequency.everyThreeDays:
        return 'Co trzy dni';
    }
  }
}
