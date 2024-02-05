import 'package:flutter/material.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE7ECEF), //TODO
      child: Column(
        children: [
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "Menu",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Divider(),
          MenuScreenButton(
            iconData: Icons.medication_outlined,
            label: 'Leki',
            destinationIndex: 3,
          ),
          Divider(),
          MenuScreenButton(
            iconData: Icons.restaurant_menu_outlined,
            label: 'Dieta',
            destinationIndex: 4,
          ),
          Divider(),
          MenuScreenButton(
            iconData: Icons.fitness_center_outlined,
            label: 'Ćwiczenia',
            destinationIndex: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
