import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/application/service/impl/picture_service.dart';
import 'package:pg_slema/features/picture/data/repository/impl/picture_repository.dart';

class LogSharedPreferencesPictureController with Logger {
  late PictureRepository repository;
  late PictureService pictureService;

  LogSharedPreferencesPictureController(this.repository, this.pictureService);

  Future printGetAllPictures() async {
    try {
      List<Picture> pictures =
          (await pictureService.getAllPictures()).cast<Picture>();
      for (var p in pictures) {
        logger.debug(p);
      }
    } catch (error) {
      logger.error("Error fetching pictures: $error");
    }
  }
}
