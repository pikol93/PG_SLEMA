import 'package:image_picker/image_picker.dart';
import 'package:pg_slema/features/picture/logic/entity/picture.dart';
import 'package:pg_slema/features/picture/logic/service/picture_service.dart';
import 'package:uuid/uuid.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class PickPictureController with Logger {
  late PictureService pictureService;
  PickPictureController(this.pictureService);

  Future<void> pickPicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String imagePath = pickedFile.path;
      String fileName = pickedFile.name;
      String fileExtension = pickedFile.path.split('.').last;
      int fileSize = await pickedFile.length();

      Picture p = Picture(
          const Uuid().v4(), imagePath, fileName, fileExtension, fileSize);
      await pictureService.addPicture(p);
    } else {
      logger.debug('Image not picked.');
    }
  }
}
