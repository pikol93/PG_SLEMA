import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineToJsonConverter {

  final NotificationRepository repository;

  MedicineToJsonConverter(this.repository);

  Medicine fromJson(Map<String, dynamic> json) {
    String medicineId = json['id'];
    return Medicine(
        medicineId,
        json['name'],
        json['intakeType'],
        repository.getAllNotificationsByMedicine(medicineId));
  }

  Map<String, dynamic> toJson(Medicine medicine) => {
    'id': medicine.id.toString(),
    'name': medicine.name.toString(),
    'intakeType': medicine.intakeType.toString(),
  };
}
