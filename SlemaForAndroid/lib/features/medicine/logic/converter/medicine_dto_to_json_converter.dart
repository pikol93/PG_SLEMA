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

    Frequency frequency = Frequency.singular;
    String firstIntakeDate =
        json['firstIntakeDate'] ?? DateTime.now().toString();
    String lastIntakeDate = json['lastIntakeDate'] ?? DateTime.now().toString();
    try {
      frequency = JsonParser.parseEnumFromJson(
          json['intakeFrequency'], Frequency.values);
    } on ArgumentError {
      //Frequency is initialized before try catch clause
    }
    return MedicineDto(
        json['id'],
        json['name'] ?? '',
        DateTime.parse(firstIntakeDate),
        DateTime.parse(lastIntakeDate),
        frequency,
        json['delayBetweenIntakes'] ?? frequency.defaultDelayBetweenIntakes,
        json['dose'] ?? '',
        json['intakeType'] ?? '',
        json['opinion'] ?? '',
        json['medicineType'] ?? '');
  }

  Map<String, dynamic> _toJson(MedicineDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        'firstIntakeDate': dto.firstIntakeDate.toString(),
        'lastIntakeDate': dto.lastIntakeDate.toString(),
        'intakeFrequency': JsonParser.parseEnumToJson(dto.intakeFrequency),
        'delayBetweenIntakes': dto.delayBetweenIntakes,
        'dose': dto.dose.toString(),
        'intakeType': dto.intakeType.toString(),
        'opinion': dto.opinion.toString(),
        'medicineType': dto.medicineType.toString(),
      };
}
