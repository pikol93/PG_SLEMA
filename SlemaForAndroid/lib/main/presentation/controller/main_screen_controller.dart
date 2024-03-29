import 'package:flutter/cupertino.dart';

class MainScreenController extends ChangeNotifier {
  int _currentIndex = 1;

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final PageController pageController = PageController();

  void onTabTapped(int index) {
    currentIndex = index;
  }
}
