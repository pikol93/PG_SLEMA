import 'dart:convert';

import 'package:pg_slema/features/medicine/data/dto/converter/medicine_dto_to_json_converter.dart';
import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';

class SharedPreferencesMedicineRepository extends MedicineRepository {
  final SharedPreferencesConnector connector = SharedPreferencesConnector();

  final MedicineToDtoConverter medicineConverter;

  SharedPreferencesMedicineRepository(this.medicineConverter);

  @override
  Future addMedicine(Medicine medicine) async {
    var jsonMedicinesList = await _getJsonMedicinesList();
    final dto = medicineConverter.toDto(medicine);
    final json = MedicineDtoToJsonConverter.toJson(dto);
    jsonMedicinesList.add(jsonEncode(json));
    await _updateMedicinesList(jsonMedicinesList);
  }

  @override
  Future deleteMedicine(Medicine medicine) async {
    var jsonMedicinesList = await _getJsonMedicinesList();
    jsonMedicinesList = jsonMedicinesList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => MedicineDtoToJsonConverter.fromJson(json))
        .where((dto) => dto.id != medicine.id)
        .map((dto) => MedicineDtoToJsonConverter.toJson(dto))
        .map((json) => jsonEncode(json))
        .toList(growable: true);

    await _updateMedicinesList(jsonMedicinesList);
  }

  @override
  Future<List<Medicine>> getAllMedicines() async {
    var jsonMedicinesList = await _getJsonMedicinesList();
    return Future.wait(jsonMedicinesList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => MedicineDtoToJsonConverter.fromJson(json))
        .map((dto) => medicineConverter.fromDto(dto))
        .toList(growable: true));
  }

  @override
  Future updateMedicine(Medicine medicine) async {
    await deleteMedicine(medicine);
    await addMedicine(medicine);
  }

  Future<List<String>> _getJsonMedicinesList() async {
    return await connector.getList(Medicine.medicineListSharedPrefKey);
  }

  Future _updateMedicinesList(List<String> jsonMedicinesList) async {
    return await connector.updateList(
        jsonMedicinesList, Medicine.medicineListSharedPrefKey);
  }
}
