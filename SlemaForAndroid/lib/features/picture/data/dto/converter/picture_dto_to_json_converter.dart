import 'package:pg_slema/features/picture/data/dto/picture_dto.dart';

class PictureDTOToJSONConverter {
  static PictureDTO fromJSON(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    String id = json['id'];
    String url = json.containsKey('url') ? json['url'] : '';
    String name = json.containsKey('name') ? json['name'] : '';
    String extension = json.containsKey('extension') ? json['extension'] : '';
    int byteSize =
        json.containsKey('byteSize') ? int.parse(json['byteSize']) : 0;

    return PictureDTO(id, url, name, extension, byteSize);
  }

  static Map<String, dynamic> toJSON(PictureDTO dto) => {
        'id': dto.id.toString(),
        'url': dto.url.toString(),
        'name': dto.name.toString(),
        'extension': dto.extension.toString(),
        'byteSize': dto.byteSize.toString(),
      };
}
