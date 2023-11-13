import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entity/medicine.dart';


class AddMedicineController extends ChangeNotifier {
  MedicineRepeat pickedMedicineRepeat = MedicineRepeat.none;
  MedicineType pickedMedicineType = MedicineType.other;
  final TimeOfDay todayTime = TimeOfDay.now();
  TimeOfDay pickedMedicineIntakeTime = TimeOfDay.now();
  final DateTime allowedFirstDate = DateTime(2000);
  final DateTime allowedLastDate = DateTime.now().add(
      const Duration(days: 365 * 5));
  final DateTime todayDate = DateTime.now();
  DateTime pickedMedicineIntakeDate = DateTime.now();
  String pickedMedicineName = "";

  static String dateTimeToString(DateTime? dateTime)
  {
    if(dateTime != null) return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
    return "";
  }

  Future<void> encodeMedicineAndSaveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? medicinesList = prefs.getStringList('medicines');
    medicinesList ??= []; //If medicines == null, then create it

    Medicine medicine = Medicine(pickedMedicineName, pickedMedicineRepeat, pickedMedicineType, pickedMedicineIntakeDate,  pickedMedicineIntakeTime);
    medicinesList.add(jsonEncode(medicine.toJson()));

    prefs.setStringList('medicines', medicinesList);
  }

}
