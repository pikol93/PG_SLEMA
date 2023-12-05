import 'dart:convert';

import 'package:pg_slema/features/medicine/data/connector/shared_preferences_connector.dart';
import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/medicine_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class SharedPreferencesMedicineRepository extends MedicineRepository {
  final SharedPreferencesConnector connector = SharedPreferencesConnector();

  final MedicineToJsonConverter converter;

  SharedPreferencesMedicineRepository(this.converter);

  @override
  void addMedicine(Medicine medicine) {
    _getJsonMedicinesList().then((jsonMedicinesList) {
      final json = converter.toJson(medicine);
      jsonMedicinesList.add(jsonEncode(json));
      _updateMedicinesList(jsonMedicinesList);
    });
  }

  @override
  void deleteMedicine(Medicine medicine) {
    _getJsonMedicinesList().then((jsonMedicinesList) {
      jsonMedicinesList = jsonMedicinesList
          .map((jsonString) => jsonDecode(jsonString))
          .map((json) => converter.fromJson(json))
          .where((element) => element.id == medicine.id)
          .map((element) => converter.toJson(element))
          .map((json) => jsonEncode(json))
          .toList(growable: true);
      _updateMedicinesList(jsonMedicinesList);
      //TODO cascade delete
    });
  }

  @override
  List<Medicine> getAllMedicines() {
    _getJsonMedicinesList().then((jsonMedicinesList) {
      return jsonMedicinesList
          .map((jsonString) => jsonDecode(jsonString))
          .map((json) => converter.fromJson(json))
          .toList(growable: true);
    });
    return List<Medicine>.empty(growable: true);
  }

  @override
  void updateMedicine(Medicine medicine) {
    deleteMedicine(medicine);
    addMedicine(medicine);
  }

  Future<List<String>> _getJsonMedicinesList() {
    return connector.getList(Medicine.medicineListSharedPrefKey);
  }

  void _updateMedicinesList(List<String> jsonMedicinesList) {
    return connector.updateList(
        jsonMedicinesList, Medicine.medicineListSharedPrefKey);
  }
}
