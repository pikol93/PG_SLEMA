import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/medicine/presentation/widget/medicine_screen.dart';

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
    MedicineScreen(),
    DietScreen(),
    ExercisesScreen(),
  ];

  void onTabTapped(int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void onPageSwiped(int index)
  {
    currentIndex = index;
  }
}
