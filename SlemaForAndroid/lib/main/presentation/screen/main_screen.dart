import 'package:flutter/material.dart';
import 'package:pg_slema/custom_icons_icons.dart';
import 'package:pg_slema/features/diet/presentation/screen/diet_screen.dart';
import 'package:pg_slema/features/exercises/presentation/screen/exercises_screen.dart';
import 'package:pg_slema/features/home/presentation/screen/home_screen.dart';
import 'package:pg_slema/features/medicine/presentation/screen/all_medicines_screen.dart';
import 'package:pg_slema/features/picture/presentation/screen/pictures_screen.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/custom_navigation_destination.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/menu/presentation/screen/menu_screen.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/screen/assessment_screen.dart';

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
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomNavigationDestination(
              icon: CustomIcons.calendar,
              selectedIcon: CustomIcons.calendar,
              label: 'Kalendarz',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 0,
            ),
            CustomNavigationDestination(
              icon: CustomIcons.house,
              selectedIcon: CustomIcons.house,
              label: 'Start',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 1,
            ),
            CustomNavigationDestination(
              icon: CustomIcons.menuBurger,
              selectedIcon: CustomIcons.menuBurger,
              label: 'Menu',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 2,
            ),
          ],
        ),
      ),
      body: <Widget>[
        const HomeScreen(),
        const HomeScreen(),
        const MenuScreen(),
        const AllMedicinesScreen(),
        const DietScreen(),
        const ExercisesScreen(),
        const PicturesScreen(),
        const AssessmentScreen()
      ][controller.currentIndex],
    );
  }
}
