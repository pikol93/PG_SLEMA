import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_value.dart';
import 'package:pg_slema/features/well_being/logic/entity/symptom_entry.dart';

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

  @override
  String toString() {
    return symptomEntries.toString();
  }
}
