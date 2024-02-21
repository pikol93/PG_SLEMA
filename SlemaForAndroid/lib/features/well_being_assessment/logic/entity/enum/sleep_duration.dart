enum SleepDuration {
  lessThan3Hours,
  from3To4Hours,
  from5To6Hours,
  from7To8Hours,
  moreThan9Hours,
}

extension SleepDurationExtension on SleepDuration {
  String get buttonTextRepresentation {
    switch (this) {
      case SleepDuration.lessThan3Hours:
        return "<3";
      case SleepDuration.from3To4Hours:
        return "3-4";
      case SleepDuration.from5To6Hours:
        return "5-6";
      case SleepDuration.from7To8Hours:
        return "7-8";
      case SleepDuration.moreThan9Hours:
        return ">9";
      default:
        throw ArgumentError("Unexpected argument \"$this\"");
    }
  }
}
