import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_value.dart';

class SymptomEntry {
  final String name;
  final SymptomValue value;

  SymptomEntry({
    required this.name,
    required this.value,
  });

  static SymptomEntry? fromJsonObject(Map<String, dynamic> map) {
    try {
      return SymptomEntry(
        name: map["name"],
        value: SymptomValueExtension.from(map["value"]),
      );
    } catch (ex) {
      return null;
    }
  }

  Map<String, dynamic> toJsonObject() {
    return {
      "name": name,
      "value": value.name,
    };
  }

  SymptomEntry copyWith({String? name, SymptomValue? value}) {
    return SymptomEntry(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}
