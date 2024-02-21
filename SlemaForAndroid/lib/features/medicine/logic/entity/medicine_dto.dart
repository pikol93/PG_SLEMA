import 'package:pg_slema/utils/data/dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class MedicineDto with Dto {
  @override
  final String id;
  final String name;
  final DateTime firstIntakeDate;
  final DateTime lastIntakeDate;
  final Frequency intakeFrequency;
  final int delayBetweenIntakes;
  final String? dose;
  final String? intakeType;
  final String? opinion;
  final String? medicineType;

  MedicineDto(this.id, this.name, this.firstIntakeDate, this.lastIntakeDate,
      this.intakeFrequency, this.delayBetweenIntakes,
      {this.dose, this.intakeType, this.opinion, this.medicineType});
}
