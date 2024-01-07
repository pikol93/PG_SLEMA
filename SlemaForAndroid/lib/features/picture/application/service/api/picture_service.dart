import 'package:pg_slema/features/picture/domain/picture.dart';

abstract class PictureService {
  Future<List<Picture>> getAllPictures();
  Future addPicture(Picture picture);
  Future updatePicture(Picture picture);
  Future deletePicture(Picture picture);
}
