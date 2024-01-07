import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/application/service/api/picture_service.dart';

import 'package:pg_slema/features/picture/data/repository/impl/picture_repository_impl.dart';

class PictureServiceImpl implements PictureService {
  final PictureRepositoryImpl _repository;

  PictureServiceImpl(this._repository);

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
