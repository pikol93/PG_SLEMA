import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/application/service/notification_service.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart' as nt;

class AddMedicineController extends ChangeNotifier {
  late NotificationService notificationService;
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
    SharedPreferencesNotificationRepository repository =
        SharedPreferencesNotificationRepository();
    repository.initializeRepository();
    notificationService = NotificationService(repository);
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

  Future<void> addNotification() async {
    var notification = nt.Notification(
        "",
        "Ważna sprawa!",
        "Nastała pora na przyjęcie $pickedMedicineName",
        pickedMedicineIntakeTime,
        pickedMedicineIntakeDate,
        pickedMedicineIntakeDate,
        Frequency.singular);

    notificationService.addNotification(notification);
  }
}
