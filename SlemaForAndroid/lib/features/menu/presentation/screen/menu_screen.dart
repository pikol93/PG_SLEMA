import 'package:flutter/material.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen_button.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen_divider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 20.0),
            child: Text(
              "Więcej",
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize:
                        Theme.of(context).textTheme.displayLarge?.fontSize,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const MenuScreenButton(
          iconData: Icons.medication_outlined,
          label: 'Lekarstwa',
          destinationIndex: 3,
        ),
        const MenuScreenDivider(),
        const MenuScreenButton(
          iconData: Icons.restaurant_menu_outlined,
          label: 'Dieta',
          destinationIndex: 4,
        ),
        const MenuScreenDivider(),
        const MenuScreenButton(
          iconData: Icons.fitness_center_outlined,
          label: 'Ćwiczenia',
          destinationIndex: 5,
        ),
        const MenuScreenDivider(),
        const MenuScreenButton(
          iconData: Icons.assessment_outlined,
          label: 'Raport',
          destinationIndex: 6,
        ),
        const MenuScreenDivider()
      ],
    );
  }
}
