import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  String toDateString() {
    final formatter = NumberFormat("00");
    return "${formatter.format(day)}.${formatter.format(month)}.$year";
  }

  int compareDates(DateTime another) {
    DateTime thisDate = DateTime(year, month, day);
    DateTime anotherDate = DateTime(another.year, another.month, another.day);
    return thisDate.compareTo(anotherDate);
  }
}
