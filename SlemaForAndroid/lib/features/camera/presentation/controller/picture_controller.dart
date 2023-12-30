import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PictureController extends ChangeNotifier {
  XFile? _picture;

  XFile? get picture => _picture;

  void setPictureFile(XFile picture) {
    _picture = picture;
    notifyListeners();
  }
}
