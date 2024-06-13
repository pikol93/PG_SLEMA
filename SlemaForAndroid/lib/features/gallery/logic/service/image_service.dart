import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';

abstract class ImageService {
  Future<List<ImageMetadata>> loadImageData();

  Future selectAndAddImageFromGallery();

  Future createAndAddImageViaCamera();
}
