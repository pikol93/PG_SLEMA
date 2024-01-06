import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/application/service/impl/picture_service.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class PickImageController with Logger {
  late PictureService pictureService;
  PickImageController(this.pictureService);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String imagePath = pickedFile.path;
      String fileName = pickedFile.name;
      String fileExtension = pickedFile.path.split('.').last;
      int fileSize = await pickedFile.length();

      await pictureService.addPicture(Picture(
          const Uuid().v4(), imagePath, fileName, fileExtension, fileSize));
    } else {
      logger.debug('Image not picked.');
    }
  }
}
