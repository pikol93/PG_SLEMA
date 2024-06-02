import 'package:flutter/material.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';

abstract class ImageMetadataRepository {
  /// Gets all saved image metadata objects
  Future<List<ImageMetadata>> getAll();

  /// Saves an [ImageMetadata] object
  Future save(ImageMetadata item);

  /// Deletes the image metadata from the repository
  Future delete(String id);

  /// Gets the related change notifier
  ChangeNotifier getChangeNotifier();
}
