
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entity/medicine.dart';

class MedicineScreenController {
  List<Medicine> medicines = [];

  Future<void> loadMedicinesFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? medicinesList = prefs.getStringList(Medicine.medicineListSharedPrefKey);

    if(medicinesList==null)
    {
      return;
    }

    //Mapping json from shared preferences to list of objects
    medicines = medicinesList.map((jsonString) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return Medicine.fromJson(jsonMap);
    }).toList();
  }
}