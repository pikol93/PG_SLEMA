import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/service/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pg_slema/features/medicine/presentation/entity/medicine.dart';

class AddMedicineController extends ChangeNotifier {
  final NotificationService notificationService = NotificationService();
  MedicineRepeat pickedMedicineRepeat = MedicineRepeat.none;
  MedicineType pickedMedicineType = MedicineType.other;
  final TimeOfDay todayTime = TimeOfDay.now();
  TimeOfDay pickedMedicineIntakeTime = TimeOfDay.now();
  final DateTime allowedFirstDate = DateTime(2000);
  final DateTime allowedLastDate =
      DateTime.now().add(const Duration(days: 365 * 5));
  final DateTime todayDate = DateTime.now();
  DateTime pickedMedicineIntakeDate = DateTime.now();
  String pickedMedicineName = "";

  AddMedicineController() : super() {
    notificationService.initNotifications();
  }

  static String dateTimeToString(DateTime? dateTime) {
    if (dateTime != null) {
      return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
    }
    return "";
  }

  Future<void> encodeMedicineAndSaveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    final medicinesList =
        prefs.getStringList(Medicine.medicineListSharedPrefKey) ?? [];

    final medicine = Medicine(pickedMedicineName, pickedMedicineRepeat,
        pickedMedicineType, pickedMedicineIntakeDate, pickedMedicineIntakeTime);
    medicinesList.add(jsonEncode(medicine.toJson()));

    prefs.setStringList(Medicine.medicineListSharedPrefKey, medicinesList);
  }

  Future<void> scheduleNotification() async {
    DateTime notificationDateTime = DateTime(
        pickedMedicineIntakeDate.year,
        pickedMedicineIntakeDate.month,
        pickedMedicineIntakeDate.day,
        pickedMedicineIntakeTime.hour,
        pickedMedicineIntakeTime.minute);

    notificationService.scheduleNotification(
        title: "Ważna sprawa!",
        body: "Nastała pora na przyjęcie $pickedMedicineName",
        scheduledNotificationDateTime: notificationDateTime);
  }
}
