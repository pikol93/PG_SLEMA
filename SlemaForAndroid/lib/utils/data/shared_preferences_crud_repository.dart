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

  Future<List<String>> _getJsonItemsList() async {
    return await connector.getList(tableKey);
  }

  Future _updateItemsList(List<String> jsonItemsList) async {
    return await connector.updateList(jsonItemsList, tableKey);
  }
}
