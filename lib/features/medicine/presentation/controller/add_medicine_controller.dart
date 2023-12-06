import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/application/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/application/service/notification_service.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart' as nt;
import 'package:uuid/uuid.dart';

class AddMedicineController extends ChangeNotifier {
  late NotificationService _notificationService;
  late MedicineService _medicineService;
  String pickedMedicineName = "";
  String typedIntakeType = "";
  List<nt.Notification> notifications =
      List<nt.Notification>.empty(growable: true);

  AddMedicineController() : super() {
    final notificationRepository = SharedPreferencesNotificationRepository();
    _notificationService = NotificationService(notificationRepository);
    final converter = MedicineToDtoConverter(_notificationService);
    final medicineRepository = SharedPreferencesMedicineRepository(converter);
    _medicineService = MedicineService(medicineRepository, _notificationService);
  }

  Future saveMedicine() async {
    Medicine medicine = Medicine(
        const Uuid().v4(), pickedMedicineName, typedIntakeType, notifications);
    _medicineService.addMedicine(medicine);
    notifications.forEach(_notificationService.addNotification);
  }
}
