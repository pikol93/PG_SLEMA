import 'package:flutter/cupertino.dart';

import '../../../features/diet/presentation/widget/diet_screen.dart';
import '../../../features/exercises/presentation/widget/exercises_screen.dart';
import '../../../features/motivation/presentation/widget/motivation_screen.dart';

class MainScreenController extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final PageController pageController = PageController();

  final List<Widget> views = [
    MotivationScreen(),
    DietScreen(),
    ExercisesScreen(),
  ];

  void onTabTapped(int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
