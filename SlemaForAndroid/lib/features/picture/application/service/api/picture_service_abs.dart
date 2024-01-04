import 'package:pg_slema/features/picture/domain/picture.dart';

abstract class PictureServiceAbs {
  Future<List<Picture>> getAllPictures();
  Future addPicture(Picture picture);
  Future updatePicture(Picture picture);
  Future deletePicture(Picture picture);
}
