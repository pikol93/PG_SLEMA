import 'dart:convert';

import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';
import 'package:pg_slema/utils/data/converter.dart';
import 'package:pg_slema/utils/data/dto.dart';

abstract class SharedPreferencesCrudRepository<T extends Dto> {
  final SharedPreferencesConnector connector = SharedPreferencesConnector();

  final CustomConverter<T, Map<String, dynamic>> dtoToJsonConverter;
  final String tableKey;

  SharedPreferencesCrudRepository(this.dtoToJsonConverter, this.tableKey);

  Future addDto(T dto) async {
    var jsonItemsList = await _getJsonItemsList();
    final json = dtoToJsonConverter.to(dto);
    jsonItemsList.add(jsonEncode(json));
    await _updateItemsList(jsonItemsList);
  }

  Future deleteDto(T dto) async {
    var jsonItemsList = await _getJsonItemsList();
    jsonItemsList = jsonItemsList
        .map(jsonDecode)
        .map((json) => dtoToJsonConverter.from(json))
        .where((e) => e.id != dto.id)
        .map(dtoToJsonConverter.to)
        .map(jsonEncode)
        .toList(growable: true);

    await _updateItemsList(jsonItemsList);
  }

  Future<List<T>> getAllDto() async {
    var jsonItemsList = await _getJsonItemsList();
    return jsonItemsList
        .map(jsonDecode)
        .map((json) => dtoToJsonConverter.from(json))
        .toList(growable: true);
  }

  Future<T> getDto(String id) async {
    var dto = await getAllDto();
    return dto.firstWhere((dto) => dto.id == id);
  }

  Future updateDto(T dto) async {
    var allDto = await getAllDto();
    final index = allDto.indexWhere((e) => e.id == dto.id);
    allDto[index] = dto;
    final jsonMedicinesList = allDto
        .map(dtoToJsonConverter.to)
        .map(jsonEncode)
        .toList(growable: true);
    await _updateItemsList(jsonMedicinesList);
  }

  Future deleteAllFrom(List<T> dto) async {
    var dtoIds = dto.map((e) => e.id).toList();

    var jsonItemsList = await _getJsonItemsList();
    jsonItemsList = jsonItemsList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => dtoToJsonConverter.from(json))
        .where((dto) => !dtoIds.contains(dto.id))
        .map((dto) => dtoToJsonConverter.to(dto))
        .map((json) => jsonEncode(json))
        .toList(growable: true);
    await _updateItemsList(jsonItemsList);
  }

  Future addAllFrom(List<T> dto) async {
    var jsonItemsList = await _getJsonItemsList();
    var newElements = dto
        .map((dto) => dtoToJsonConverter.to(dto))
        .map((e) => jsonEncode(e))
        .toList(growable: true);
    jsonItemsList.addAll(newElements);
    await _updateItemsList(jsonItemsList);
  }

  Future updateAllFrom(List<T> dto) async {
    var allDto = await getAllDto();
    for (var element in dto) {
      final index = allDto.indexWhere((e) => e.id == element.id);
      allDto[index] = element;
    }
    final jsonMedicinesList = allDto
        .map(dtoToJsonConverter.to)
        .map(jsonEncode)
        .toList(growable: true);
    await _updateItemsList(jsonMedicinesList);
  }

  Future<List<String>> _getJsonItemsList() async {
    return await connector.getList(tableKey);
  }

  Future _updateItemsList(List<String> jsonItemsList) async {
    return await connector.updateList(jsonItemsList, tableKey);
  }
}
