import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class MedicineEventWidgetController {
  late String _languageCode = "pl";

  String getIntakeDateRepresentationBasedOnFrequency(Medicine medicine) {
    DateTime dateTime = medicine.intakeDate;
    if (medicine.intakeFrequency == Frequency.daily) {
      dateTime = DateTime.now();
    }
    return _getDateStringRepresentation(dateTime);
  }

  String _getDateStringRepresentation(DateTime dateTime) {
    DateFormat formatter = DateFormat('EEE, d MMM y', _languageCode);
    return formatter.format(dateTime);
  }

  void setLanguage(BuildContext context) {
    _languageCode = Localizations.localeOf(context).languageCode;
  }
}
