import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_screen.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercises_screen.dart';
import 'package:pg_slema/features/medicine/presentation/widget/get_medicines_screen.dart';
import 'package:pg_slema/features/motivation/presentation/widget/motivation_screen.dart';

class MainScreenController extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final PageController pageController = PageController();

  final List<Widget> views = [
    const MotivationScreen(),
    const GetMedicinesScreen(),
    const DietScreen(),
    const ExercisesScreen(),
  ];

  void onTabTapped(int index) {
    currentIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.ease,
    );
  }
}
