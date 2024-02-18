import 'package:flutter/material.dart';
import 'package:pg_slema/features/home/presentation/widget/home_screen.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/custom_navigation_destination.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_screen.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercises_screen.dart';
import 'package:pg_slema/features/medicine/presentation/widget/get_medicines_screen.dart';

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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              tooltip: 'Kalendarz',
              icon: const Icon(Icons.calendar_month_outlined),
              onPressed: () {
                controller.currentIndex = 0;
              },
            ),
            IconButton(
              tooltip: 'Start',
              icon: const Icon(Icons.home_outlined),
              onPressed: () {
                controller.currentIndex = 1;
              },
            ),
            IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu),
              onPressed: () {
                controller.currentIndex = 2;
              },
            ),
          ],
        ),
      ),
      body: <Widget>[
        HomeScreen(),
        HomeScreen(),
        MenuScreen(),
        GetMedicinesScreen(),
        DietScreen(),
        ExercisesScreen(),
      ][controller.currentIndex],
    );
  }
}

// class MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Provider.of<MainScreenController>(context);
//
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
//         selectedIndex: controller.currentIndex,
//         onDestinationSelected: controller.onTabTapped,
//         destinations: const <Widget>[
//           CustomNavigationDestination(
//               icon: Icon(Icons.calendar_month_outlined),
//               selectedIcon: Icon(Icons.calendar_month),
//               label: 'Kalendarz'),
//           CustomNavigationDestination(
//               icon: Icon(Icons.home_outlined),
//               selectedIcon: Icon(Icons.home),
//               label: 'Start'),
//           CustomNavigationDestination(
//               icon: Icon(Icons.menu_outlined),
//               selectedIcon: Icon(Icons.menu),
//               label: 'Menu'),
//         ],
//       ),
//       body: <Widget>[
//         HomeScreen(),
//         HomeScreen(),
//         MenuScreen(),
//         GetMedicinesScreen(),
//       ][controller.currentIndex],
//     );
//   }
// }

// body: PageView(
// controller: controller.pageController,
// physics: const NeverScrollableScrollPhysics(),
// children: const [
// HomeScreen(),
// GetMedicinesScreen(),
// DietScreen(),
// ExercisesScreen(),
// ],
// ),
// bottomNavigationBar: NavigationBar(
// labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
// selectedIndex: controller.currentIndex,
// onDestinationSelected: controller.onTabTapped,
// destinations: const <Widget>[
// CustomNavigationDestination(
// icon: Icon(Icons.home_outlined),
// selectedIcon: Icon(Icons.home),
// label: 'Start'),
// CustomNavigationDestination(
// icon: Icon(Icons.medication_outlined),
// selectedIcon: Icon(Icons.medication),
// label: 'Leki'),
// CustomNavigationDestination(
// icon: Icon(Icons.restaurant_menu_outlined),
// selectedIcon: Icon(Icons.restaurant_menu),
// label: 'Dieta'),
// CustomNavigationDestination(
// icon: Icon(Icons.fitness_center_outlined),
// selectedIcon: Icon(Icons.fitness_center),
// label: 'Ćwiczenia'),
// ],
