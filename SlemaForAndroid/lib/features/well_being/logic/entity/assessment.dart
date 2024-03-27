import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_duration.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_quality.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_entries.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';

class Assessment {
  final int id;
  final DateTime intakeDate;
  final WellBeing wellBeing;
  final SymptomEntries symptomEntries;
  final SleepDuration sleepDuration;
  final SleepQuality sleepQuality;

  Assessment({
    required this.id,
    required this.intakeDate,
    required this.wellBeing,
    required this.symptomEntries,
    required this.sleepDuration,
    required this.sleepQuality,
  });

  bool isOlderThan(Assessment other) {
    return intakeDate.isAfter(other.intakeDate);
  }

  Assessment copyWith({
    int? id,
    DateTime? intakeDate,
    WellBeing? wellBeing,
    SymptomEntries? symptomEntries,
    SleepDuration? sleepDuration,
    SleepQuality? sleepQuality,
  }) {
    return Assessment(
      id: id ?? this.id,
      intakeDate: intakeDate ?? this.intakeDate,
      wellBeing: wellBeing ?? this.wellBeing,
      symptomEntries: symptomEntries ?? this.symptomEntries,
      sleepDuration: sleepDuration ?? this.sleepDuration,
      sleepQuality: sleepQuality ?? this.sleepQuality,
    );
  }

  /// Converts a given [map] to an [Assessment] object. Throws an exception if the [map] could not be converted.
  static Assessment fromJsonObject(Map<String, dynamic> map) {
    return Assessment(
      id: map["id"],
      intakeDate: DateTime.parse(map["intakeDate"]),
      wellBeing: WellBeingExtension.from(map["wellBeing"]),
      symptomEntries: SymptomEntries.fromJsonObject(
          List<Map<String, dynamic>>.from(map["symptomEntries"]))!,
      sleepDuration: SleepDurationExtension.from(map["sleepDuration"]),
      sleepQuality: SleepQualityExtension.from(map["sleepQuality"]),
    );
  }

  Map<String, dynamic> toJsonObject() {
    return {
      "id": id,
      "intakeDate": intakeDate.toString(),
      "wellBeing": wellBeing.name,
      "symptomEntries": symptomEntries.toJsonObject(),
      "sleepDuration": sleepDuration.name,
      "sleepQuality": sleepQuality.name,
    };
  }
}
