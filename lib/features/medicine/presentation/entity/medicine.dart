import 'package:flutter/material.dart';
import 'package:pg_slema/utils/string/string_casing_extension.dart';

enum MedicineRepeat { none, daily, everyTwoDays, weekly }

enum MedicineType { pill, liquid, other }

class Medicine {
  static List<String> repeatTextList = [
    'Jednorazowo',
    'Codziennie',
    'Co dwa dni',
    'Co tydzień'
  ];
  static String medicineListSharedPrefKey = 'medicines';
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
        _parseTimeOfDay(json['intakeTime']));
  }

  //String to enum
  static T _parseEnum<T>(String value, List<T> values) {
    return values.firstWhere((e) => e.toString() == value,
        orElse: () => values[0]);
  }

  //String to TimeOfDay
  static TimeOfDay _parseTimeOfDay(String value) {
    List<String> parts = value.split(":");
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type.toString(),
        'repeat': repeat.toString(),
        'intakeDate': intakeDate.toString(),
        'intakeTime':
            '${intakeTime.hour}:${intakeTime.minute.toString().padLeft(2, '0')}', //default .toString return useless value
      };

  static String getRepeatToText(MedicineRepeat repeat) {
    try {
      return repeatTextList[repeat.index];
    } on RangeError catch (_) {
      return repeat.name.toCapitalized();
    }
  }
}
