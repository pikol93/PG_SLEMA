import 'package:pg_slema/utils/data/dto.dart';

class PictureDto with Dto {
  @override
  final String id;
  final String url;
  final String name;
  final String extension;
  final int byteSize;

  PictureDto(this.id, this.url, this.name, this.extension, this.byteSize);

  @override
  set id(String id) {
    this.id = id;
  }
}
