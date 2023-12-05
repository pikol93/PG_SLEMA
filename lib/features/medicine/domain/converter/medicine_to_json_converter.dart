import 'package:pg_slema/features/medicine/application/service/notification_service.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineToJsonConverter {
  final NotificationService service;

  MedicineToJsonConverter(this.service);

  Future<Medicine> fromJson(Map<String, dynamic> json) async {
    String medicineId = json['id'];
    return Medicine(medicineId, json['name'], json['intakeType'],
        await service.getAllNotificationsByMedicine(medicineId));
  }

  Map<String, dynamic> toJson(Medicine medicine) => {
        'id': medicine.id.toString(),
        'name': medicine.name.toString(),
        'intakeType': medicine.intakeType.toString(),
      };
}
