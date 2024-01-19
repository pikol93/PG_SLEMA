import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pg_slema/utils/date/date.dart';

class CalendarController {
  DateTime pickedDate = DateTime.now();
  late DateTime firstDate;
  final monthsAllowedToGoBack = 6;
  DateTime lastDate = DateTime.now();
  late String languageCode;

  CalendarController() {
    const daysInYearApprox = 365;
    const monthsInYear = 12;
    firstDate = DateTime.now().subtract(Duration(
        days: (daysInYearApprox * 1.0 / monthsInYear * monthsAllowedToGoBack)
            .round()));
  }

  String getPickedDateStringRepresentationForAppBar() {
    DateFormat formatter = DateFormat('EEE, d MMM, yyyy', languageCode);
    String dateString = pickedDate.isToday
        ? "Dzisiaj"
        : pickedDate.isYesterday
            ? "Wczoraj"
            : formatter.format(pickedDate);

    return dateString;
  }

  void setLanguage(BuildContext context) {
    languageCode = Localizations.localeOf(context).languageCode;
  }

  void subtractOneDayFromPickedDateIfPossible() {
    DateTime newDay = pickedDate.subtract(const Duration(days: 1));
    pickedDate = newDay.isAfter(firstDate.subtract(const Duration(days: 1)))
        ? newDay
        : pickedDate;
  }

  void addOneDayFromPickedDateIfPossible() {
    DateTime newDay = pickedDate.add(const Duration(days: 1));
    pickedDate = newDay.isBefore(DateTime.now()) ? newDay : pickedDate;
  }
}
