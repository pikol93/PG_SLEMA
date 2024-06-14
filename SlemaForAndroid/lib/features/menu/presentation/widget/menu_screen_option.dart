import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/menu/presentation/widget/menu_screen_button.dart';
import 'package:pg_slema/utils/widgets/dividers/menu_option_divider.dart';

class MenuScreenOption extends StatelessWidget {
  final IconData iconData;
  final String label;
  final int destinationIndex;

  const MenuScreenOption({
    super.key,
    required this.iconData,
    required this.label,
    required this.destinationIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuScreenButton(
          iconData: iconData,
          label: label,
          destinationIndex: destinationIndex,
        ),
        const MenuOptionDivider(),
      ],
    );
  }
}
