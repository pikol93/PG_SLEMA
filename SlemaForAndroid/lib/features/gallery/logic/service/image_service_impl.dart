import 'dart:io';

import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/logic/repository/stored_image_metadata_repository.dart';
import 'package:pg_slema/features/gallery/logic/service/image_service.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ImageServiceImpl with Logger implements ImageService {
  final StoredImageMetadataRepository repository;

  ImageServiceImpl({
    required this.repository,
  });

  @override
  Future<List<ImageMetadata>> loadImageData() async {
    final storedImageMetadata = await repository.getAll();
    final imageFutures = storedImageMetadata.map((item) async {
      try {
        final stat = await FileStat.stat(item.filename);

        return ImageMetadata(
          id: item.id,
          filename: item.filename,
          date: stat.modified,
        );
      } catch (ex) {
        logger.warning("Could not stat file ${item.filename}");
        return null;
      }
    });

    final data = await Future.wait(imageFutures);
    return data
        .where((item) => item != null)
        .map((item) => item!)
        .toList(growable: false);
  }
}
