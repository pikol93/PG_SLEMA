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
        dto.firstIntakeDate,
        dto.lastIntakeDate,
        dto.intakeFrequency,
        await service.getAllNotificationsByMedicine(medicineId),
        dto.delayBetweenIntakes,
        dose: dto.dose,
        intakeType: dto.intakeType,
        opinion: dto.opinion,
        medicineType: dto.medicineType);
  }

  MedicineDto toDto(Medicine medicine) {
    return MedicineDto(
        medicine.id,
        medicine.name,
        medicine.firstIntakeDate,
        medicine.lastIntakeDate,
        medicine.intakeFrequency,
        medicine.delayBetweenIntakes,
        dose: medicine.dose,
        intakeType: medicine.intakeType,
        opinion: medicine.opinion,
        medicineType: medicine.medicineType);
  }
}
