import 'package:pg_slema/features/picture/data/dto/picture_dto.dart';

class PictureDTOToJSONConverter {
  static PictureDTO fromJSON(Map<String, dynamic> json) {
    //TODO sprawdzenie czy mozna odczytac np. json['id']

    return PictureDTO(json['id'], json['url'], json['name'], json['extension'],
        int.parse(json['byteSize']));
  }

  static Map<String, dynamic> toJSON(PictureDTO dto) => {
        'id': dto.id.toString(),
        'url': dto.url.toString(),
        'name': dto.name.toString(),
        'extension': dto.extension.toString(),
        'byteSize': dto.byteSize.toString(),
      };
}
