import 'package:flutter/material.dart';
import 'package:mutex/mutex.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/logic/repository/image_metadata_repository.dart';
import 'package:pg_slema/utils/change_notifier_impl.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class SharedPreferencesImageMetadataRepository
    with Logger
    implements ImageMetadataRepository {
  static const String _assessmentsSharedPreferencesKey = 'image_metadata';

  final rwLock = ReadWriteMutex();
  final changeNotifier = ChangeNotifierImpl();
  final sharedPreferencesConnector = SharedPreferencesConnector();
  final items = List<ImageMetadata>.empty(growable: true);

  /// Do not use this ctor outside this class. If an instance of [SharedPreferencesImageMetadataRepository] is needed, then use the [create] method.
  SharedPreferencesImageMetadataRepository._();

  /// Creates a new instance of [ApplicationInfoRepositoryImpl]. Serves as a workaround for dart not allowing async constructors.
  static Future<SharedPreferencesImageMetadataRepository> create() async {
    final self = SharedPreferencesImageMetadataRepository._();
    await self._load();
    return self;
  }

  @override
  Future<List<ImageMetadata>> getAll() {
    return rwLock.protectRead(() async => items);
  }

  @override
  Future save(ImageMetadata item) {
    rwLock.protectWrite(() async {
      items.removeWhere((itemInList) => itemInList.id == item.id);
      items.add(item);
    });

    return _save();
  }

  @override
  Future delete(String id) {
    rwLock.protectWrite(() async {
      items.removeWhere((itemInList) => itemInList.id == id);
    });

    return _save();
  }

  @override
  ChangeNotifier getChangeNotifier() {
    return changeNotifier;
  }

  Future _load() async {
    final entries = await sharedPreferencesConnector
        .getList(_assessmentsSharedPreferencesKey);

    final assessments = entries
        .map(
          (json) {
            try {
              return ImageMetadata.fromJson(json);
            } catch (ex) {
              logger.debug(
                "Could not convert map to assessment. JSON = $json, exception = $ex",
              );
              return null;
            }
          },
        )
        .where((element) => element != null)
        .map((e) => e!)
        .toList();

    await rwLock.protectWrite(() async {
      items.clear();
      items.addAll(assessments);
    });

    logger.debug("Loaded image metadata from shared preferences.");
  }

  Future _save() async {
    List<ImageMetadata> assessments = await rwLock.protectRead(() async {
      return List.from(items, growable: false);
    });

    List<String> json = assessments.map((e) => e.toJson()).toList();

    await sharedPreferencesConnector.updateList(
      json,
      _assessmentsSharedPreferencesKey,
    );

    logger.debug("Saved image metadata to shared preferences.");
    changeNotifier.notifyListeners();
  }
}
