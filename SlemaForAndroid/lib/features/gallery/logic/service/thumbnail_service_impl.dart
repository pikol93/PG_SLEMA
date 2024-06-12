import 'dart:io';

import 'package:flutter/material.dart' as material;
import 'package:path_provider/path_provider.dart';
import 'package:pg_slema/features/gallery/logic/service/thumbnail_service.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:image/image.dart';

class ThumbnailServiceImpl extends ThumbnailService with Logger {
  @override
  Future<material.Image?> loadThumbnail(
      String id, String imagePath, int width) async {
    // if (id != "5663bc83-c4a6-48d8-8b41-324a105f6f42") {
    //   return Future.value(null);
    // }

    final directory = await getTemporaryDirectory();
    final thumbnailPath = "${directory.path}/_thumbnails/$id.png";

    final thumbnailA = await _loadThumbnail(thumbnailPath);
    if (thumbnailA != null) {
      return thumbnailA;
    }

    return _generateThumbnail(imagePath, thumbnailPath, width);
  }

  Future<material.Image?> _loadThumbnail(String thumbnailPath) async {
    try {
      final file = File(thumbnailPath);
      final bytes = await file.readAsBytes();
      return material.Image.memory(bytes);
    } catch (ex) {
      logger.debug("Could not load thumbnail from path: $thumbnailPath");
      return null;
    }
  }

  Future<material.Image?> _generateThumbnail(
      String imagePath, String thumbnailPath, int width) async {
    try {
      final imageFile = File(imagePath);
      final imageBytes = await imageFile.readAsBytes();
      final image = decodeImage(imageBytes);
      final resizedImage = copyResize(
        image!,
        width: width,
      );
      final thumbnailImage = encodePng(resizedImage);
      final thumbnailFile = File(thumbnailPath);
      await thumbnailFile.create(recursive: true);
      await thumbnailFile.writeAsBytes(thumbnailImage);

      logger.debug(
          "Generated thumbnail for image \"$imagePath\" at \"$thumbnailPath\"");

      return _loadThumbnail(thumbnailPath);
    } catch (ex) {
      logger.debug("Could not generate thumbnail for image $imagePath");
      return null;
    }
  }
}
