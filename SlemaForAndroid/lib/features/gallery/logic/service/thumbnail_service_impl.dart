import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pg_slema/features/gallery/logic/service/thumbnail_service.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ThumbnailServiceImpl extends ThumbnailService with Logger {
  @override
  Future<Image?> loadThumbnail(String imagePath) async {
    try {
      // TODO: Create actual thumbnail instead of just an image
      logger.error("loading image: $imagePath");
      final thumbnailFile = File(imagePath);
      final bytes = await thumbnailFile.readAsBytes();
      return Image.memory(bytes);
    } catch (ex) {
      logger.error("Could not load thumbnail: ", ex);
      return Future.value(null);
    }
  }
}
