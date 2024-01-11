import 'dart:convert';

import 'package:pg_slema/features/picture/data/repository/api/picture_repository_abs.dart';
import 'package:pg_slema/features/picture/domain/converter/picture_to_dto_converter.dart';
import 'package:pg_slema/features/picture/data/dto/converter/picture_dto_to_json_converter.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/data/dto/picture_dto.dart';

import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesPictureRepository extends SharedPreferencesCrudRepository<PictureDto> with PictureRepository {

  SharedPreferencesPictureRepository(PictureDtoToJsonConverter converter) : super(converter, Picture.pictureListSharedPrefKey);

  @override
  Future addPicture(Picture picture) async {
    PictureDto dto = PictureToDTOConverter.toDTO(picture);
    await addDto(dto);
  }

  @override
  Future deletePicture(Picture picture) async {
    PictureDto dto = PictureToDTOConverter.toDTO(picture);
    await deleteDto(dto);
  }

  @override
  Future<List<Picture>> getAllPictures() async {
    List<PictureDto> picturesDto = await getAllDto();
    return picturesDto
        .map((dto) => PictureToDTOConverter.fromDTO(dto))
        .toList(growable: true);
  }

  @override
  Future updatePicture(Picture picture) async {
    PictureDto dto = PictureToDTOConverter.toDTO(picture);
    await updateDto(dto);
  }
}
