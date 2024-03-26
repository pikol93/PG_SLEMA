import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_value.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';

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

class SymptomEntries {
  final List<SymptomEntry> symptomEntries;

  SymptomEntries({required this.symptomEntries});

  static SymptomEntries? fromJsonObject(List<Map<String, dynamic>> map) {
    try {
      return SymptomEntries(
        symptomEntries: map
            .map((e) => SymptomEntry.fromJsonObject(e))
            .where((element) => element != null)
            .map((e) => e!)
            .toList(),
      );
    } catch (ex) {
      return null;
    }
  }

  List<Map<String, dynamic>> toJsonObject() {
    return symptomEntries.map((e) => e.toJsonObject()).toList();
  }

  SymptomEntries copyWithReplacedEntry(SymptomEntry entry) {
    final result = List<SymptomEntry>.from(symptomEntries);
    int index = result.indexed
        .firstWhere((element) => element.$2.name == entry.name)
        .$1;

    result[index] = entry;
    return SymptomEntries(symptomEntries: result);
  }

  SymptomEntries copyWithAdditionalEntry(String name) {
    final result = List<SymptomEntry>.from(symptomEntries);
    result.add(
      SymptomEntry(
        name: name,
        value: SymptomValue.none,
      ),
    );

    return SymptomEntries(symptomEntries: result);
  }

  SymptomEntries copyWithRemovedEntry(int index) {
    final result = List<SymptomEntry>.from(symptomEntries);
    result.removeAt(index);
    return SymptomEntries(symptomEntries: result);
  }

  SymptomEntries copyWithSwappedIndexes(int indexA, int indexB) {
    final result = List<SymptomEntry>.from(symptomEntries);
    SymptomEntry swapped = result[indexA];
    result[indexA] = result[indexB];
    result[indexB] = swapped;

    return SymptomEntries(symptomEntries: result);
  }

  SymptomEntry? findEntryByName(String name) {
    return symptomEntries.where((element) => element.name == name).firstOrNull;
  }
}

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
