import 'package:pg_slema/features/medicine/application/service/notification_service.dart';
import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';

import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineService {
  final MedicineRepository repository;

  final NotificationService notificationService;

  MedicineService(this.repository, this.notificationService);

  Future<List<Medicine>> getAllMedicines() async {
    return await repository.getAllMedicines();
  }

  Future addMedicine(Medicine medicine) async {
    await repository.addMedicine(medicine);
  }

  Future updateMedicine(Medicine medicine) async {
    await repository.updateMedicine(medicine);
  }

  Future deleteMedicine(Medicine medicine) async {
    await notificationService.deleteNotificationsByMedicine(medicine.id);
    await repository.deleteMedicine(medicine);
  }
}
