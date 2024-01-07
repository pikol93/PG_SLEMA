import 'package:pg_slema/features/medicine/data/dto/medicine_dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class MedicineDtoToJsonConverter {
  static MedicineDto fromJson(Map<String, dynamic> json) {
    String firstIntakeDate = json.containsKey('firstIntakeDate')
        ? json['firstIntakeDate']
        : DateTime.now().toString();
    String lastIntakeDate = json.containsKey('lastIntakeDate')
        ? json['lastIntakeDate']
        : DateTime.now().toString();
    String frequency = json.containsKey('intakeFrequency')
        ? json['intakeFrequency']
        : JsonParser.parseEnumToJson(Frequency.singular);
    return MedicineDto(
        json['id'],
        json.containsKey('name') ? json['name'] : '',
        json.containsKey('intakeType') ? json['intakeType'] : '',
        DateTime.parse(firstIntakeDate),
        DateTime.parse(lastIntakeDate),
        JsonParser.parseEnumFromJson<Frequency>(frequency, Frequency.values));
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
