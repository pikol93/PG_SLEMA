import 'package:flutter/material.dart';

/// A workaround for a warning appearing when trying to call [notifyListeners] directly on a [ChangeNotifier] instance. Using this class prevents the warning from appearing.
class ChangeNotifierImpl extends ChangeNotifier {
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
