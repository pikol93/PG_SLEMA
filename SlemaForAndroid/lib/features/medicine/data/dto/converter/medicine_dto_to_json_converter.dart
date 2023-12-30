import 'package:pg_slema/features/medicine/data/dto/medicine_dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class MedicineDtoToJsonConverter {
  static MedicineDto fromJson(Map<String, dynamic> json) {
    return MedicineDto(
        json['id'],
        json['name'],
        json['intakeType'],
        DateTime.parse(json['firstIntakeDate']),
        DateTime.parse(json['lastIntakeDate']),
        JsonParser.parseEnumFromJson<Frequency>(
            json['intakeFrequency'], Frequency.values));
  }

  static Map<String, dynamic> toJson(MedicineDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        'intakeType': dto.intakeType.toString(),
        'firstIntakeDate': dto.firstIntakeDate.toString(),
        'lastIntakeDate': dto.lastIntakeDate.toString(),
        'intakeFrequency': JsonParser.parseEnumToJson(dto.intakeFrequency)
      };
}
