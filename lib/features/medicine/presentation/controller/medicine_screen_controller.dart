import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineScreenController {
  List<Medicine> medicines = [];

  Future<void> loadMedicinesFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? jsonMedicinesList =
        prefs.getStringList(Medicine.medicineListSharedPrefKey);

    if (jsonMedicinesList == null) {
      return;
    }

    //Mapping json from shared preferences to list of objects
    medicines = jsonMedicinesList.map((jsonString) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return Medicine.fromJson(jsonMap);
    }).toList();
  }
}
