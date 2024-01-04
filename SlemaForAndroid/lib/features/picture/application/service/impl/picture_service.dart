import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/application/service/api/picture_service_abs.dart';

import 'package:pg_slema/features/picture/data/repository/impl/picture_repository.dart';

class PictureService implements PictureServiceAbs {
  final PictureRepository _repository;

  PictureService(this._repository);

  @override
  Future<List<Picture>> getAllPictures() async {
    return await _repository.getAllPictures();
  }

  @override
  Future addPicture(Picture picture) async {
    await _repository.addPicture(picture);
  }

  @override
  Future updatePicture(Picture picture) async {
    await _repository.updatePicture(picture);
  }

  @override
  Future deletePicture(Picture picture) async {
    await _repository.deletePicture(picture);
  }
}
