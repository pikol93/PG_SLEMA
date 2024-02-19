import 'package:flutter/material.dart';
import 'package:pg_slema/features/home/presentation/screen/home_screen.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/custom_navigation_destination.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/diet/presentation/screen/diet_screen.dart';
import 'package:pg_slema/features/exercises/presentation/screen/exercises_screen.dart';
import 'package:pg_slema/features/medicine/presentation/screen/all_medicines_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainScreenController>(context);

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          AllMedicinesScreen(),
          DietScreen(),
          ExercisesScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: controller.currentIndex,
        onDestinationSelected: controller.onTabTapped,
        destinations: const <Widget>[
          CustomNavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Start'),
          CustomNavigationDestination(
              icon: Icon(Icons.medication_outlined),
              selectedIcon: Icon(Icons.medication),
              label: 'Leki'),
          CustomNavigationDestination(
              icon: Icon(Icons.restaurant_menu_outlined),
              selectedIcon: Icon(Icons.restaurant_menu),
              label: 'Dieta'),
          CustomNavigationDestination(
              icon: Icon(Icons.fitness_center_outlined),
              selectedIcon: Icon(Icons.fitness_center),
              label: 'Ćwiczenia'),
        ],
      ),
    );
  }
}
