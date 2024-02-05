import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/notification/application/service/notification_service.dart';

class MedicineService {
  final MedicineRepository _repository;
  final NotificationService _notificationService;

  MedicineService(this._repository, this._notificationService);

  Future<List<Medicine>> getAllMedicines() async {
    return await _repository.getAllMedicines();
  }

  Future addMedicine(Medicine medicine) async {
    await _repository.addMedicine(medicine);
    await _notificationService.addMultipleNotifications(medicine.notifications);
  }

  Future updateMedicine(Medicine medicine) async {
    await _notificationService.deleteNotificationsByMedicine(medicine.id);
    await _repository.updateMedicine(medicine);
    await _notificationService.addMultipleNotifications(medicine.notifications);
  }

  Future deleteMedicine(String id) async {
    await _repository.deleteMedicine(id);
    await _notificationService.deleteNotificationsByMedicine(id);
  }
}
