import 'package:flutter/material.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainScreenController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main screen app bar'),
      ),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageSwiped,
        children: controller.views,
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: controller.currentIndex,
        onDestinationSelected: controller.onTabTapped,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.lightbulb_outlined),
            icon: Icon(Icons.lightbulb),
            label: 'Motywacja',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.medication_outlined),
            icon: Icon(Icons.medication),
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
