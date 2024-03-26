import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_entries.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';

class Assessment {
  final int id;
  final DateTime intakeDate;
  final WellBeing wellBeing;
  final SymptomEntries symptomEntries;

  Assessment({
    required this.id,
    required this.intakeDate,
    required this.wellBeing,
    required this.symptomEntries,
  });

  bool isOlderThan(Assessment other) {
    return intakeDate.isAfter(other.intakeDate);
  }

  Assessment copyWith({
    int? id,
    DateTime? intakeDate,
    WellBeing? wellBeing,
    SymptomEntries? symptomEntries,
  }) {
    return Assessment(
      id: id ?? this.id,
      intakeDate: intakeDate ?? this.intakeDate,
      wellBeing: wellBeing ?? this.wellBeing,
      symptomEntries: symptomEntries ?? this.symptomEntries,
    );
  }

  /// Converts a given [map] to an [Assessment] object. Returns null if the [map] could not be converted.
  static Assessment? fromJsonObject(Map<String, dynamic> map) {
    try {
      return Assessment(
          id: map["id"],
          intakeDate: DateTime.parse(map["intakeDate"]),
          wellBeing: WellBeingExtension.from(map["wellBeing"]),
          symptomEntries:
              SymptomEntries.fromJsonObject(map["symptomEntries"])!);
    } catch (ex) {
      return null;
    }
  }

  Map<String, dynamic> toJsonObject() {
    return {
      "id": id,
      "intakeDate": intakeDate.toString(),
      "wellBeing": wellBeing.name,
      "symptomEntries": symptomEntries.toJsonObject(),
    };
  }
}
