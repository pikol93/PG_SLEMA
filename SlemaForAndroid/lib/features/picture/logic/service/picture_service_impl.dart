import 'package:pg_slema/features/picture/logic/entity/picture.dart';
import 'package:pg_slema/features/picture/logic/repository/shared_preferences_picture_repository.dart';
import 'package:pg_slema/features/picture/logic/service/picture_service.dart';

class PictureServiceImpl implements PictureService {
  final SharedPreferencesPictureRepository _repository;

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
  Future deletePicture(String id) async {
    await _repository.deletePicture(id);
  }
}
