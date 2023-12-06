import 'dart:convert';

import 'package:pg_slema/features/medicine/data/connector/shared_preferences_connector.dart';
import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';
import 'package:pg_slema/features/medicine/data/dto/converter/medicine_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class SharedPreferencesMedicineRepository extends MedicineRepository {
  final SharedPreferencesConnector connector = SharedPreferencesConnector();

  final MedicineToJsonConverter converter;

  SharedPreferencesMedicineRepository(this.converter);

  @override
  Future addMedicine(Medicine medicine) async {
    var jsonMedicinesList = await _getJsonMedicinesList();
    final json = converter.toJson(medicine);
    jsonMedicinesList.add(jsonEncode(json));
    _updateMedicinesList(jsonMedicinesList);
  }

  @override
  Future deleteMedicine(Medicine medicine) async {
    var jsonMedicinesList = await _getJsonMedicinesList();
    var medicinesList = await Future.wait(jsonMedicinesList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => converter.fromJson(json))
        .toList());

    medicinesList
        .where((element) => element.id == medicine.id)
        .map((element) => converter.toJson(element))
        .map((json) => jsonEncode(json))
        .toList(growable: true);
    _updateMedicinesList(jsonMedicinesList);
  }

  @override
  Future<List<Medicine>> getAllMedicines() async {
    var jsonMedicinesList = await _getJsonMedicinesList();
    return Future.wait(jsonMedicinesList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => converter.fromJson(json))
        .toList(growable: true));
  }

  @override
  Future updateMedicine(Medicine medicine) async {
    await deleteMedicine(medicine);
    addMedicine(medicine);
  }

  Future<List<String>> _getJsonMedicinesList() async {
    return connector.getList(Medicine.medicineListSharedPrefKey);
  }

  Future _updateMedicinesList(List<String> jsonMedicinesList) async {
    return connector.updateList(
        jsonMedicinesList, Medicine.medicineListSharedPrefKey);
  }
}
