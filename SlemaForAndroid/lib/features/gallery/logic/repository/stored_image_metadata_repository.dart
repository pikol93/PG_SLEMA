import 'package:flutter/material.dart';
import 'package:pg_slema/features/gallery/logic/entity/stored_image_metadata.dart';

abstract class StoredImageMetadataRepository {
  /// Gets all saved image metadata objects
  Future<List<StoredImageMetadata>> getAll();

  /// Saves an [StoredImageMetadata] object
  Future save(StoredImageMetadata item);

  /// Deletes the image metadata from the repository
  Future delete(String id);

  /// Gets the related change notifier
  ChangeNotifier getChangeNotifier();
}
