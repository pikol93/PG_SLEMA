import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider extends ChangeNotifier {
  final CameraDescription _cameraDescription;

  CameraDescription get cameraDescription => _cameraDescription;

  CameraProvider(this._cameraDescription);
}
