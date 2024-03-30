import 'package:pg_slema/features/picture/logic/entity/picture.dart';
import 'package:pg_slema/features/picture/logic/entity/picture_dto.dart';

class PictureToDtoConverter {
  static Picture fromDto(PictureDto dto) {
    String pictureID = dto.id;
    return Picture(pictureID, dto.url, dto.name, dto.extension, dto.byteSize);
  }

  static PictureDto toDto(Picture picture) {
    return PictureDto(picture.id, picture.url, picture.name, picture.extension,
        picture.byteSize);
  }
}
