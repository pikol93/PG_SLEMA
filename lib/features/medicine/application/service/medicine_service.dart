import 'package:pg_slema/features/medicine/application/service/notification_service.dart';
import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';

import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineService {
  final MedicineRepository repository;

  final NotificationService notificationService;

  MedicineService(this.repository, this.notificationService);

  Future<List<Medicine>> getAllMedicines() async {
    return repository.getAllMedicines();
  }

  void addMedicine(Medicine medicine) {
    repository.addMedicine(medicine);
  }

  void updateMedicine(Medicine medicine) {
    repository.updateMedicine(medicine);
  }

  void deleteMedicine(Medicine medicine) {
    repository.deleteMedicine(medicine);
    notificationService.deleteNotificationsByMedicine(medicine.id);
  }
}
