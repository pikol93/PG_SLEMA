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
}
