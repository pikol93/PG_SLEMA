import 'package:pg_slema/features/medicine/application/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/application/service/notification_service.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/medicine_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineScreenController {
  List<Medicine> medicines = [];
  late final MedicineService _medicineService;

  MedicineScreenController() : super() {
    SharedPreferencesNotificationRepository repository =
        SharedPreferencesNotificationRepository();
    NotificationService notificationService = NotificationService(repository);
    MedicineToJsonConverter converter =
        MedicineToJsonConverter(notificationService);
    SharedPreferencesMedicineRepository medicineRepository =
        SharedPreferencesMedicineRepository(converter);
    _medicineService = MedicineService(medicineRepository);
    _medicineService.getAllMedicines().then((value) => medicines = value);
  }

  void reloadMedicines() {
    _medicineService.getAllMedicines().then((value) => medicines = value);
  }
}
