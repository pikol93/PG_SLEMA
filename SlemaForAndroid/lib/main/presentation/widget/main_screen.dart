import 'package:flutter/material.dart';
import 'package:pg_slema/features/home/presentation/widget/home_screen.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/custom_navigation_destination.dart';
import 'package:provider/provider.dart';
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
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: controller.currentIndex,
        onDestinationSelected: controller.onTabTapped,
        destinations: const <Widget>[
          CustomNavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Kalendarz'),
          CustomNavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Start'),
          CustomNavigationDestination(
              icon: Icon(Icons.menu_outlined),
              selectedIcon: Icon(Icons.menu),
              label: 'Menu'),
        ],
      ),
    );
  }
}
