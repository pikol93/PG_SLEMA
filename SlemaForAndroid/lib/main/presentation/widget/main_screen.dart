import 'package:flutter/material.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:provider/provider.dart';

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
        children: controller.views,
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: controller.currentIndex,
        onDestinationSelected: controller.onTabTapped,
        height: 70,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.lightbulb),
            icon: Icon(Icons.lightbulb_outlined),
            label: 'Motywacja',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.medication),
            icon: Icon(Icons.medication_outlined),
            label: 'Leki',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.restaurant_menu_outlined),
            icon: Icon(Icons.restaurant_menu),
            label: 'Dieta',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fitness_center_outlined),
            icon: Icon(Icons.fitness_center),
            label: 'Ćwiczenia',
          ),
        ],
      ),
    );
  }
}
