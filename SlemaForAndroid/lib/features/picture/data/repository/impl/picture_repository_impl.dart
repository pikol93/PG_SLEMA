import 'dart:convert';

import 'package:pg_slema/features/picture/data/repository/api/picture_repository_abs.dart';
import 'package:pg_slema/features/picture/domain/converter/picture_to_dto_converter.dart';
import 'package:pg_slema/features/picture/data/dto/converter/picture_dto_to_json_converter.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/data/dto/picture_dto.dart';

import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';

class PictureRepositoryImpl implements PictureRepository {
  final SharedPreferencesConnector connector;

  PictureRepositoryImpl(this.connector);

  @override
  Future addPicture(Picture picture) async {
    List<String> jsonPicturesList = await _getJsonPicturesList();
    PictureDTO dto = PictureToDTOConverter.toDTO(picture);
    final json = PictureDTOToJSONConverter.toJSON(dto);
    jsonPicturesList.add(jsonEncode(json));
    await _updatePicturesList(jsonPicturesList);
  }

  @override
  Future deletePicture(Picture picture) async {
    List<String> jsonPicturesList = await _getJsonPicturesList();

    jsonPicturesList = jsonPicturesList
        .map(jsonDecode)
        .map((json) => PictureDTOToJSONConverter.fromJSON(json))
        .where((dto) => dto.id != picture.id)
        .map(PictureDTOToJSONConverter.toJSON)
        .map(jsonEncode)
        .toList(growable: true);

    await _updatePicturesList(jsonPicturesList);
  }

  @override
  Future<List<Picture>> getAllPictures() async {
    List<String> jsonPicturesList = await _getJsonPicturesList();
    return jsonPicturesList
        .map(jsonDecode)
        .map((decoded) => PictureDTOToJSONConverter.fromJSON(decoded))
        .map((dto) => PictureToDTOConverter.fromDTO(dto))
        .toList(growable: true);
  }

  @override
  Future updatePicture(Picture picture) async {
    //TODO Nie wiem czy ten update ma w ogole sens.
    //Co ma ciało Picture? Czy wszystkie pola na pewno sa uzupelnione?

    List<String> jsonPicturesList = await _getJsonPicturesList();
    List<PictureDTO> pictureDTOList = jsonPicturesList
        .map(jsonDecode)
        .map((decoded) => PictureDTOToJSONConverter.fromJSON(decoded))
        .toList(growable: true);

    PictureDTO dto = PictureToDTOConverter.toDTO(picture);
    int updateIdx = pictureDTOList.indexOf(dto);
    pictureDTOList[updateIdx] = dto;

    jsonPicturesList = pictureDTOList
        .map(PictureDTOToJSONConverter.toJSON)
        .map(jsonEncode)
        .toList(growable: true);

    _updatePicturesList(jsonPicturesList);
  }

  Future<List<String>> _getJsonPicturesList() async {
    return await connector.getList(Picture.pictureListSharedPrefKey);
  }

  Future _updatePicturesList(List<String> jsonPicturesList) async {
    return await connector.updateList(
        jsonPicturesList, Picture.pictureListSharedPrefKey);
  }
}
