import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/application/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/application/service/notification_service.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/data/dto/converter/medicine_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart' as nt;
import 'package:uuid/uuid.dart';

class AddMedicineController extends ChangeNotifier {
  late NotificationService _notificationService;
  late MedicineService _medicineService;
  final _medicineId = const Uuid().v4();
  String pickedMedicineName = "";
  String typedIntakeType = "";
  List<nt.Notification> notifications =
      List<nt.Notification>.empty(growable: true);

  AddMedicineController() : super() {
    SharedPreferencesNotificationRepository repository =
        SharedPreferencesNotificationRepository();
    _notificationService = NotificationService(repository);
    MedicineToJsonConverter converter =
        MedicineToJsonConverter(_notificationService);
    SharedPreferencesMedicineRepository medicineRepository =
        SharedPreferencesMedicineRepository(converter);
    _medicineService = MedicineService(medicineRepository);
  }

  Future saveMedicine() async {
    Medicine medicine = Medicine(
        _medicineId, pickedMedicineName, typedIntakeType, notifications);
    _medicineService.addMedicine(medicine);
  }
}
