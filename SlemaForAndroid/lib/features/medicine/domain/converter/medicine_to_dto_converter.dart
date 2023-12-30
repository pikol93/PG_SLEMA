import 'package:pg_slema/features/medicine/data/dto/medicine_dto.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/notification/application/service/notification_service.dart';

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
