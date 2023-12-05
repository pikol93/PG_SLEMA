import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';

import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineService {
  final MedicineRepository repository;

  MedicineService(this.repository);

  Future<List<Medicine>> getAllMedicines() async {
    return repository.getAllMedicines();
  }

  Future addMedicine(Medicine medicine) async {
    repository.addMedicine(medicine);
  }

  Future updateMedicine(Medicine medicine) async {
    repository.updateMedicine(medicine);
  }

  Future deleteMedicine(Medicine medicine) async {
    repository.deleteMedicine(medicine);
    //TODO cascade delete -> onMedicineDeleted event? and observer NotificationService
    //  another approach -> notificationsRepository.deleteNotificationsByMedicine()
  }
}
