import 'package:pg_slema/features/medicine/application/service/medicine_service.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/notification/application/service/notification_service.dart';
import 'package:pg_slema/features/notification/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineScreenController {
  List<Medicine> medicines = [];
  late final MedicineService _medicineService;

  MedicineScreenController() : super() {
    final notificationRepository = SharedPreferencesNotificationRepository();
    final notificationService = NotificationService(notificationRepository);
    final converter = MedicineToDtoConverter(notificationService);
    final medicineRepository = SharedPreferencesMedicineRepository(converter);
    _medicineService = MedicineService(medicineRepository, notificationService);
    _medicineService.getAllMedicines().then((value) => medicines = value);
  }

  void reloadMedicines() {
    _medicineService.getAllMedicines().then((value) => medicines = value);
  }

  void deleteMedicine(Medicine medicine) {
    medicines.removeWhere((element) => element.id == medicine.id);
    _medicineService.deleteMedicine(medicine);
  }

  void addMedicine(Medicine medicine) {
    medicines.add(medicine);
    _medicineService.addMedicine(medicine);
  }
}
