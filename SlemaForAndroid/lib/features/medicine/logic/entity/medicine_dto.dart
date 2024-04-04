import 'package:pg_slema/utils/data/dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class MedicineDto with Dto {
  @override
  final String id;
  final String name;
  final DateTime intakeDate;
  final Frequency intakeFrequency;
  final String dose;
  final String intakeType;
  final String opinion;
  final String medicineType;

  MedicineDto(this.id, this.name, this.intakeDate, this.intakeFrequency,
      this.dose, this.intakeType, this.opinion, this.medicineType);
}
