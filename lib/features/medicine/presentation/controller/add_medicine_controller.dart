
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMedicineController extends ChangeNotifier {
  final TimeOfDay todayTime = TimeOfDay.now();
  TimeOfDay? pickedMedicineIntakeTime = TimeOfDay.now();
  final DateTime allowedFirstDate = DateTime(2000);
  final DateTime allowedLastDate = DateTime.now().add(
      const Duration(days: 365 * 5));
  final DateTime todayDate = DateTime.now();
  DateTime? pickedMedicineIntakeDate = DateTime.now();

  String dateTimeToString(DateTime? dateTime)
  {
    if(dateTime != null) return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
    return "";
  }

}
