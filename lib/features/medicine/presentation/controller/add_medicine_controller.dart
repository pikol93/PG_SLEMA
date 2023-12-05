import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/application/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/application/service/notification_service.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/medicine_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart' as nt;
import 'package:uuid/uuid.dart';

class AddMedicineController extends ChangeNotifier {
  late NotificationService notificationService;
  late MedicineService medicineService;
  final _medicineId = const Uuid().v4();
  String pickedMedicineName = "";
  String typedIntakeType = "";
  List<nt.Notification> notifications = List<nt.Notification>.empty(growable: true);

  AddMedicineController() : super() {
    SharedPreferencesNotificationRepository repository =
        SharedPreferencesNotificationRepository();
    notificationService = NotificationService(repository);
    MedicineToJsonConverter converter =
        MedicineToJsonConverter(notificationService);
    SharedPreferencesMedicineRepository medicineRepository =
        SharedPreferencesMedicineRepository(converter);
    medicineService = MedicineService(medicineRepository);
  }

  saveMedicine() {
    Medicine medicine = Medicine(_medicineId, pickedMedicineName, pickedMedicineName, notifications);
    medicineService.addMedicine(medicine);
  }
}
