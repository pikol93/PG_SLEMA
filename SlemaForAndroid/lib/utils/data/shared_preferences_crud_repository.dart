import 'dart:convert';

import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';
import 'package:pg_slema/utils/data/converter.dart';
import 'package:pg_slema/utils/data/dto.dart';
import 'package:pg_slema/utils/data/entity.dart';

abstract class SharedPreferencesCrudRepository<T extends Entity, S extends Dto> {
  final SharedPreferencesConnector connector = SharedPreferencesConnector();

  final CustomConverter<T, S> entityToDtoConverter;
  final CustomConverter<S, Map<String, dynamic>> dtoToJsonConverter;
  final String tableKey;

  SharedPreferencesCrudRepository(this.entityToDtoConverter, this.dtoToJsonConverter, this.tableKey);

  Future addEntity(T entity) async {
    var jsonItemsList = await _getJsonItemsList();
    final dto = entityToDtoConverter.convertTo(entity);
    final json = dtoToJsonConverter.convertTo(dto);
    jsonItemsList.add(jsonEncode(json));
    await _updateItemsList(jsonItemsList);
  }

  Future deleteEntity(T entity) async {
    var jsonItemsList = await _getJsonItemsList();
    jsonItemsList = jsonItemsList
        .map(jsonDecode)
        .map((json) => dtoToJsonConverter.convertFrom(json))
        .where((dto) => dto.id != entity.id)
        .map(dtoToJsonConverter.convertTo)
        .map(jsonEncode)
        .toList(growable: true);

    await _updateItemsList(jsonItemsList);
  }

  Future<List<S>> getAllDto() async {
    var jsonItemsList = await _getJsonItemsList();
    return jsonItemsList
        .map(jsonDecode)
        .map((json) => dtoToJsonConverter.convertFrom(json))
        .toList(growable: true);
  }

  Future updateEntity(T entity) async {
    var allDto = await getAllDto();
    final index = allDto.indexWhere((element) => element.id == entity.id);
    allDto[index] = entityToDtoConverter.convertTo(entity);
    final jsonMedicinesList = allDto
        .map(dtoToJsonConverter.convertTo)
        .map(jsonEncode)
        .toList(growable: true);
    await _updateItemsList(jsonMedicinesList);
  }

  Future<List<String>> _getJsonItemsList() async {
    return await connector.getList(tableKey);
  }

  Future _updateItemsList(List<String> jsonItemsList) async {
    return await connector.updateList(
        jsonItemsList, tableKey);
  }
}
