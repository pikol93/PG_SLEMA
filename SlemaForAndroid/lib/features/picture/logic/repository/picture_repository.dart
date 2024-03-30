import 'package:pg_slema/features/picture/logic/entity/picture.dart';

mixin PictureRepository {
  Future<List<Picture>> getAllPictures();

  Future addPicture(Picture picture);

  Future updatePicture(Picture picture);

  Future deletePicture(String id);
}
