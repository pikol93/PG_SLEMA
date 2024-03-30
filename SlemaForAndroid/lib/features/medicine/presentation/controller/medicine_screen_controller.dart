import 'package:pg_slema/features/medicine/logic/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/logic/repository/shared_preferences_medicine_repository.dart';
import 'package:pg_slema/features/medicine/logic/service/medicine_service.dart';
import 'package:pg_slema/features/notification/logic/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/notification/logic/service/notification_service.dart';

class MedicineScreenController {
  final Function onMedicinesChanged;
  List<Medicine> medicines = List.empty(growable: true);
  late final MedicineService _medicineService;

  MedicineScreenController(this.onMedicinesChanged) : super() {
    final notificationRepository = SharedPreferencesNotificationRepository();
    final notificationService = NotificationService(notificationRepository);
    final converter = MedicineToDtoConverter(notificationService);
    final medicineRepository = SharedPreferencesMedicineRepository(converter);
    _medicineService = MedicineService(medicineRepository, notificationService);
  }

  Future initializeMedicines() async {
    medicines = await _medicineService.getAllMedicines();
    onMedicinesChanged();
  }

  void deleteMedicine(Medicine medicine) {
    medicines.removeWhere((element) => element.id == medicine.id);
    _medicineService.deleteMedicine(medicine.id);
    onMedicinesChanged();
  }

  void addMedicine(Medicine medicine) {
    medicines.add(medicine);
    _medicineService.addMedicine(medicine);
    onMedicinesChanged();
  }

  void editMedicine(Medicine medicine) {
    final index = medicines.indexWhere((element) => element.id == medicine.id);
    medicines[index] = medicine;
    _medicineService.updateMedicine(medicine);
    onMedicinesChanged();
  }
}
