import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';

import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineService {
  final MedicineRepository repository;

  MedicineService(this.repository);

  List<Medicine> getAllMedicines() {
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
    //TODO cascade delete -> onMedicineDeleted event? and observer NotificationService
    //  another approach -> notificationsRepository.deleteNotificationsByMedicine()
  }
}
