import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine_dto.dart';
import 'package:pg_slema/features/notification/logic/service/notification_service.dart';

class MedicineToDtoConverter {
  final NotificationService service;

  MedicineToDtoConverter(this.service);

  Future<Medicine> fromDto(MedicineDto dto) async {
    String medicineId = dto.id;
    return Medicine(
        medicineId,
        dto.name,
        dto.intakeType,
        dto.firstIntakeDate,
        dto.lastIntakeDate,
        dto.intakeFrequency,
        await service.getAllNotificationsByMedicine(medicineId));
  }

  MedicineDto toDto(Medicine medicine) {
    return MedicineDto(
        medicine.id,
        medicine.name,
        medicine.intakeType,
        medicine.firstIntakeDate,
        medicine.lastIntakeDate,
        medicine.intakeFrequency);
  }
}