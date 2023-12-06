import 'package:pg_slema/features/medicine/data/dto/medicineDto.dart';

class MedicineDtoToJsonConverter {

  static MedicineDto fromJson(Map<String, dynamic> json) {
    return MedicineDto(json['id'], json['name'], json['intakeType']);
  }

  Map<String, dynamic> toJson(MedicineDto medicine) => {
        'id': medicine.id.toString(),
        'name': medicine.name.toString(),
        'intakeType': medicine.intakeType.toString(),
      };
}
