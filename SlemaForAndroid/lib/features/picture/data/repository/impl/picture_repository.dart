import 'dart:convert';

import 'package:pg_slema/features/picture/data/repository/api/picture_repository_abs.dart';
import 'package:pg_slema/features/picture/domain/converter/picture_to_dto_converter.dart';
import 'package:pg_slema/features/picture/data/dto/converter/picture_dto_to_json_converter.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/data/dto/picture_dto.dart';

import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';

class PictureRepository implements PictureRepositoryAbs {
  final SharedPreferencesConnector connector;

  PictureRepository(this.connector);

  @override
  Future addPicture(Picture picture) async {
    List<String> jsonPicturesList = await _getJsonPicturesList();
    PictureDTO dto = PictureToDTOConverter.toDTO(picture);
    final json = PictureDTOToJSONConverter.toJSON(dto);
    jsonPicturesList.add(jsonEncode(json));
    await _updatePicturesList(jsonPicturesList);
  }

  @override
  Future deletePicture(Picture picture) {
    // TODO: implement deletePicture
    throw UnimplementedError();
  }

  @override
  Future<List<Picture>> getAllPictures() async {
    List<String> jsonPicturesList = await _getJsonPicturesList();

    List<Picture> allPictures = [];
    for (String jsonString in jsonPicturesList) {
      dynamic decoded = json.decode(jsonString);
      PictureDTO pictureDTO = PictureDTOToJSONConverter.fromJSON(decoded);
      Picture picture = PictureToDTOConverter.fromDTO(pictureDTO);
      allPictures.add(picture);
    }

    return allPictures;
  }

  @override
  Future updatePicture(Picture picture) {
    // TODO: implement updatePicture
    throw UnimplementedError();
  }

  Future<List<String>> _getJsonPicturesList() async {
    return await connector.getList(Picture.pictureListSharedPrefKey);
  }

  Future _updatePicturesList(List<String> jsonPicturesList) async {
    return await connector.updateList(
        jsonPicturesList, Picture.pictureListSharedPrefKey);
  }
}
