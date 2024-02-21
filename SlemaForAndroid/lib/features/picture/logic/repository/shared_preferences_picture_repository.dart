import 'package:pg_slema/features/picture/logic/converter/picture_dto_to_json_converter.dart';
import 'package:pg_slema/features/picture/logic/converter/picture_to_dto_converter.dart';
import 'package:pg_slema/features/picture/logic/entity/picture.dart';
import 'package:pg_slema/features/picture/logic/entity/picture_dto.dart';
import 'package:pg_slema/features/picture/logic/repository/picture_repository.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesPictureRepository
    extends SharedPreferencesCrudRepository<PictureDto> with PictureRepository {
  SharedPreferencesPictureRepository()
      : super(PictureDtoToJsonConverter(), Picture.pictureListSharedPrefKey);

  @override
  Future addPicture(Picture picture) async {
    PictureDto dto = PictureToDtoConverter.toDto(picture);
    await addDto(dto);
  }

  @override
  Future deletePicture(String id) async {
    await deleteDto(id);
  }

  @override
  Future<List<Picture>> getAllPictures() async {
    List<PictureDto> picturesDto = await getAllDto();
    return picturesDto
        .map((dto) => PictureToDtoConverter.fromDto(dto))
        .toList(growable: true);
  }

  @override
  Future updatePicture(Picture picture) async {
    PictureDto dto = PictureToDtoConverter.toDto(picture);
    await updateDto(dto);
  }
}
