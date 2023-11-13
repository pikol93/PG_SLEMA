import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';

enum MedicineRepeat { none, daily, everyTwoDays, weekly }
enum MedicineType { pill, liquid, other }

class Medicine{
  final String name;
  final MedicineRepeat repeat;
  final MedicineType type;
  final DateTime intakeDate;
  final TimeOfDay intakeTime;

  Medicine(this.name, this.repeat, this.type, this.intakeDate, this.intakeTime);

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      json['name'],
      _parseEnum<MedicineRepeat>(json['repeat'], MedicineRepeat.values),
      _parseEnum<MedicineType>(json['type'], MedicineType.values),
      DateTime.parse(json['intakeDate']),
      TimeOfDay.fromDateTime(DateTime.parse(json['intakeTime'])),
    );
  }

  //String to enum
  static T _parseEnum<T>(String value, List<T> values) {
    return values.firstWhere((e) => e.toString() == value, orElse: () => values[0]);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type.toString(),
    'repeat': repeat.toString(),
    'intakeDate': intakeDate.toString(),
    'intakeTime': intakeTime.toString(),
  };

}