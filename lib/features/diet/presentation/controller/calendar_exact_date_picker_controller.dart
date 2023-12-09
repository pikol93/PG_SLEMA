import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pg_slema/utils/date/date.dart';

class CalendarExactDatePickerController {
  DateTime pickedDate = DateTime.now();
  late DateTime firstDate;
  final yearsAllowedToGoBack = 5;
  DateTime lastDate = DateTime.now();
  late String languageCode;

  CalendarExactDatePickerController() {
    firstDate = DateTime.now().subtract(const Duration(days: 365 * 5));
  }

  String getPickedDateStringRepresentationForAppBar() {
    DateFormat formatter = DateFormat('EEE, d MMM, yyyy', languageCode);

    // TODO localization issue
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
}
