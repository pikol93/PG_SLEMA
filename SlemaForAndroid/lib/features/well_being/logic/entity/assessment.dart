class Assessment {
  final int id;
  final DateTime intakeDate;

  Assessment({required this.id, required this.intakeDate});

  bool isOlderThan(Assessment other) {
    return intakeDate.isAfter(other.intakeDate);
  }

  Assessment copyWith({
    int? id,
    DateTime? intakeDate,
  }) {
    return Assessment(
      id: id ?? this.id,
      intakeDate: intakeDate ?? this.intakeDate,
    );
  }

  /// Converts a given [map] to an [Assessment] object. Returns null if the [map] could not be converted.
  static Assessment? fromJsonObject(Map<String, dynamic> map) {
    try {
      return Assessment(
        id: map["id"],
        intakeDate: DateTime.parse(map["intakeDate"]),
      );
    } catch (ex) {
      return null;
    }
  }

  Map<String, dynamic> toJsonObject() {
    return {
      "id": id,
      "intakeDate": intakeDate.toString(),
    };
  }
}
