import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/application/service/impl/picture_service.dart';

class LogSharedPreferencesPictureController with Logger {
  late PictureService pictureService;

  LogSharedPreferencesPictureController(this.pictureService);

  Future printGetAllPictures() async {
    try {
      List<Picture> pictures =
          (await pictureService.getAllPictures()).cast<Picture>();

      String picturesMessage = "Pictures in sharedpreferences:\n";
      for (var p in pictures) {
        picturesMessage += "$p\n";
      }
      logger.debug(picturesMessage);
    } catch (error) {
      logger.error("Error fetching pictures: $error");
    }
  }
}
