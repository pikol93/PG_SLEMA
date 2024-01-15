import 'package:pg_slema/features/picture/data/dto/picture_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';

class PictureDtoToJsonConverter
    with CustomConverter<PictureDto, Map<String, dynamic>> {
  @override
  PictureDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(PictureDto t) {
    return _toJson(t);
  }

  PictureDto _fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    String id = json['id'];
    String url = json.containsKey('url') ? json['url'] : '';
    String name = json.containsKey('name') ? json['name'] : '';
    String extension = json.containsKey('extension') ? json['extension'] : '';
    int byteSize =
        json.containsKey('byteSize') ? int.parse(json['byteSize']) : 0;

    return PictureDto(id, url, name, extension, byteSize);
  }

  Map<String, dynamic> _toJson(PictureDto dto) => {
        'id': dto.id.toString(),
        'url': dto.url.toString(),
        'name': dto.name.toString(),
        'extension': dto.extension.toString(),
        'byteSize': dto.byteSize.toString(),
      };
}
