import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:pg_slema/features/picture/application/service/impl/picture_service_impl.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class PictureListController with Logger {
  late List<Picture> pictures = [];
  late List<Uint8List?> picturesImages = [];
  late final PictureServiceImpl _pictureService;
  final _refreshPictureListController = StreamController<void>.broadcast();
  Stream<void> get refreshStream => _refreshPictureListController.stream;
  PictureListController(this._pictureService) {
    refreshPicturesData();
  }

  Future<List<Picture>> getAllPictures() async {
    List<Picture> pictures = [];
    try {
      pictures = await _pictureService.getAllPictures();
    } catch (error) {
      logger.error(
          "Error fetching pictures: $error\nfor $PictureListController.");
      pictures = [];
    }

    return pictures;
  }

  Future<Uint8List?> _getImageFromFile(String filePath) async {
    try {
      final file = File(filePath);

      if (await file.exists()) {
        return await file.readAsBytes();
      } else {
        logger.warning('File does not exist.');
        return null;
      }
    } catch (e) {
      logger.error('Error fetching picture from file: $e.');
      return null;
    }
  }

  Future _reloadPicturesWithImages() async {
    pictures = await getAllPictures();

    List<Uint8List?> picturesImagesList = [];
    for (Picture picture in pictures) {
      Uint8List? imageBytes = await _getImageFromFile(picture.url);
      picturesImagesList.add(imageBytes);
    }

    picturesImages = picturesImagesList;
  }

  void refreshPicturesData() async {
    await _reloadPicturesWithImages(); //Pobierz nowe dane z shared preferences
    _refreshPictureListController
        .add(null); //Powiadom picture list zeby sie przeladowalo
  }
}
