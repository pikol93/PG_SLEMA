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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              iconData,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(height: .75)),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 40,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
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
