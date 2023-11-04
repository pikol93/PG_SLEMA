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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        iconSize: 40,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Motivation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Diet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Exercises',
          ),
        ],
        onTap: controller.onTabTapped,
      ),
    );
  }
}
