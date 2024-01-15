import 'package:pg_slema/utils/data/dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class MedicineDto with Dto {
  @override
  final String id;
  final String name;
  final String intakeType;
  final DateTime firstIntakeDate;
  final DateTime lastIntakeDate;
  final Frequency intakeFrequency;

  MedicineDto(this.id, this.name, this.intakeType, this.firstIntakeDate,
      this.lastIntakeDate, this.intakeFrequency);
}
