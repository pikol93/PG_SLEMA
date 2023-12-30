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
        .map(jsonDecode)
        .map((json) => MedicineDtoToJsonConverter.fromJson(json))
        .where((dto) => dto.id != medicine.id)
        .map(MedicineDtoToJsonConverter.toJson)
        .map(jsonEncode)
        .toList(growable: true);

    await _updateMedicinesList(jsonMedicinesList);
  }

  @override
  Future<List<Medicine>> getAllMedicines() async {
    var jsonMedicinesList = await _getJsonMedicinesList();
    return Future.wait(jsonMedicinesList
        .map(jsonDecode)
        .map((json) => MedicineDtoToJsonConverter.fromJson(json))
        .map(medicineConverter.fromDto)
        .toList(growable: true));
  }

  @override
  Future updateMedicine(Medicine medicine) async {
    List<Medicine> medicines = await getAllMedicines(); //TODO: remove it and achieve it in faster way -> _getMedicinesDto, same in notifications
    final index = medicines.indexWhere((element) => element.id == medicine.id);
    medicines[index] = medicine;
    final jsonMedicinesList = medicines
        .map(medicineConverter.toDto)
        .map(MedicineDtoToJsonConverter.toJson)
        .map(jsonEncode)
        .toList(growable: true);

    await _updateMedicinesList(jsonMedicinesList);
  }

  Future<List<String>> _getJsonMedicinesList() async {
    return await connector.getList(Medicine.medicineListSharedPrefKey);
  }

  Future _updateMedicinesList(List<String> jsonMedicinesList) async {
    return await connector.updateList(
        jsonMedicinesList, Medicine.medicineListSharedPrefKey);
  }
}
