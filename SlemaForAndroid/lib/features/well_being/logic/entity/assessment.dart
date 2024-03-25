import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';

class Assessment {
  final int id;
  final DateTime intakeDate;
  final WellBeing wellBeing;

  Assessment(
      {required this.id, required this.intakeDate, required this.wellBeing});

  bool isOlderThan(Assessment other) {
    return intakeDate.isAfter(other.intakeDate);
  }

  Assessment copyWith({
    int? id,
    DateTime? intakeDate,
    WellBeing? wellBeing,
  }) {
    return Assessment(
      id: id ?? this.id,
      intakeDate: intakeDate ?? this.intakeDate,
      wellBeing: wellBeing ?? this.wellBeing,
    );
  }

  /// Converts a given [map] to an [Assessment] object. Returns null if the [map] could not be converted.
  static Assessment? fromJsonObject(Map<String, dynamic> map) {
    try {
      return Assessment(
        id: map["id"],
        intakeDate: DateTime.parse(map["intakeDate"]),
        wellBeing: WellBeingExtension.from(map["wellBeing"]),
      );
    } catch (ex) {
      return null;
    }
  }

  Map<String, dynamic> toJsonObject() {
    return {
      "id": id,
      "intakeDate": intakeDate.toString(),
      "wellBeing": wellBeing.savedValueRepresentation,
    };
  }
}
