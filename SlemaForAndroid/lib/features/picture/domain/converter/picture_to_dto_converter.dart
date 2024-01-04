import 'package:pg_slema/features/picture/data/dto/picture_dto.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';

class PictureToDTOConverter {
  static Picture fromDTO(PictureDTO dto) {
    String pictureID = dto.id;
    return Picture(pictureID, dto.url, dto.name, dto.extension, dto.byteSize);
  }

  static PictureDTO toDTO(Picture picture) {
    return PictureDTO(picture.id, picture.url, picture.name, picture.extension,
        picture.byteSize);
  }
}
