import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/application/service/impl/picture_service_impl.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class TakePictureController with Logger {
  late PictureServiceImpl pictureService;
  TakePictureController(this.pictureService);

  Future<void> takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      String imagePath = pickedFile.path;
      String fileName = pickedFile.name;
      String fileExtension = pickedFile.path.split('.').last;
      int fileSize = await pickedFile.length();

      Picture p = Picture(
          const Uuid().v4(), imagePath, fileName, fileExtension, fileSize);
      await pictureService.addPicture(p);
    } else {
      logger.debug('Image not taken.');
    }
  }
}
