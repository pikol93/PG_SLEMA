import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/application/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/notification/application/service/notification_service.dart';
import 'package:pg_slema/features/notification/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/notification/domain/get_notification.dart';
import 'package:pg_slema/utils/time_of_day/time_of_day_comparing_extension.dart';

class AddMedicineController extends ChangeNotifier {
  late final NotificationService _notificationService;
  late final MedicineService _medicineService;
  String pickedMedicineName = "";
  String typedIntakeType = "";
  List<GetNotification> notifications =
      List<GetNotification>.empty(growable: true);
  DateTime endIntakeDate = DateTime.now();

  AddMedicineController() : super() {
    final notificationRepository = SharedPreferencesNotificationRepository();
    _notificationService = NotificationService(notificationRepository);
    final converter = MedicineToDtoConverter(_notificationService);
    final medicineRepository = SharedPreferencesMedicineRepository(converter);
    _medicineService =
        MedicineService(medicineRepository, _notificationService);
  }

  Future saveMedicine() async {
    /*
    Medicine medicine = Medicine(
        const Uuid().v4(), pickedMedicineName, typedIntakeType, notifications);
    _medicineService.addMedicine(medicine);
    notifications.forEach(_notificationService.addNotification);
    */
    //TODO: add missing fields to form, add logger to verify everything
  }

  DateTime _getDateTimeForSingularIntakeMedicine() {
    var currentTime = TimeOfDay.now();
    return notifications
        .where((notification) => !notification.notificationTime.isHigher(currentTime))
        .isNotEmpty ? DateTime.now().add(const Duration(days: 1)) : DateTime.now();
  }
}
