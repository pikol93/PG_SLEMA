import 'package:pg_slema/features/medicine/logic/entity/medicine_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class MedicineDtoToJsonConverter
    with CustomConverter<MedicineDto, Map<String, dynamic>> {
  @override
  MedicineDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(MedicineDto t) {
    return _toJson(t);
  }

  MedicineDto _fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    Frequency frequency = _getFrequency(json['intakeFrequency']);
    String intakeDate = json['intakeDate'] ?? DateTime.now().toString();

    return MedicineDto(
        json['id'],
        json['name'] ?? '',
        DateTime.parse(intakeDate),
        frequency,
        json['dose'] ?? '',
        json['intakeType'] ?? '',
        json['opinion'] ?? '',
        json['medicineType'] ?? '');
  }

  Map<String, dynamic> _toJson(MedicineDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        'intakeDate': dto.intakeDate.toString(),
        'intakeFrequency': JsonParser.parseEnumToJson(dto.intakeFrequency),
        'dose': dto.dose.toString(),
        'intakeType': dto.intakeType.toString(),
        'opinion': dto.opinion.toString(),
        'medicineType': dto.medicineType.toString(),
      };

  Frequency _getFrequency(String? jsonKey) {
    Frequency frequency = Frequency.singular;
    try {
      frequency = JsonParser.parseEnumFromJson(jsonKey, Frequency.values);
    } on ArgumentError {
      //Frequency is initialized before try catch clause
    }
    return frequency;
  }
}
