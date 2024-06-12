import 'package:flutter/material.dart';

abstract class ThumbnailService {
  /// Loads the thumbnail related to a given image
  Future<Image?> loadThumbnail(String id, String imagePath, int width);
}
