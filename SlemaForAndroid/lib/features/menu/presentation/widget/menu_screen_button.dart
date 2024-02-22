import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';

class MenuScreenButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final int destinationIndex;

  const MenuScreenButton(
      {super.key,
      required this.iconData,
      required this.label,
      required this.destinationIndex});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainScreenController>(context);

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              iconData,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    height: 0.52381,
                  ),
            ),
          ],
        ),
      ),
      onTap: () {
        controller.onTabTapped(destinationIndex);
      },
    );
  }
}
