import 'package:flutter/material.dart';
import 'package:pg_slema/features/calendar/presentation/screen/calendar_screen.dart';
import 'package:pg_slema/features/diet/presentation/screen/diet_screen.dart';
import 'package:pg_slema/features/exercises/presentation/screen/exercises_screen.dart';
import 'package:pg_slema/features/home/presentation/screen/home_screen.dart';
import 'package:pg_slema/features/medicine/presentation/screen/all_medicines_screen.dart';
import 'package:pg_slema/features/picture/presentation/screen/pictures_screen.dart';
import 'package:pg_slema/features/settings/presentation/screen/settings_screen.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/screen/all_assessments_screen.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/custom_navigation_destination.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/menu/presentation/screen/menu_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainScreenController>(context);
    final assessmentFactory =
        Provider.of<AssessmentFactory>(context, listen: false);
    final assessmentsService =
        Provider.of<AssessmentsService>(context, listen: false);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomNavigationDestination(
              icon: Icons.calendar_month_outlined,
              selectedIcon: Icons.calendar_month,
              label: 'Kalendarz',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 0,
            ),
            CustomNavigationDestination(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Start',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 1,
            ),
            CustomNavigationDestination(
              icon: Icons.menu_outlined,
              selectedIcon: Icons.menu,
              label: 'Menu',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 2,
            ),
          ],
        ),
      ),
      body: <Widget>[
        const CalendarScreen(),
        HomeScreen(
          assessmentFactory: widget.assessmentFactory,
          assessmentService: widget.assessmentsService,
        ),
        const MenuScreen(),
        const AllMedicinesScreen(),
        const DietScreen(),
        const ExercisesScreen(),
        const PicturesScreen(),
        AllAssessmentsScreen(
          service: assessmentsService,
          factory: assessmentFactory,
        ),
        const SettingsScreen(),
      ][controller.currentIndex],
    );
  }
}
