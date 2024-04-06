import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/link_button.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';

class MenuScreenButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final int destinationIndex;

  const MenuScreenButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.destinationIndex,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainScreenController>(context);

    return LinkButton(
        iconData: iconData,
        label: label,
        onTap: () {
          controller.onTabTapped(destinationIndex);
        });
  }
}
