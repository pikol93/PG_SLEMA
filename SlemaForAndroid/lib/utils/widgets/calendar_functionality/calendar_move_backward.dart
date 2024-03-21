import 'package:flutter/material.dart';
import 'package:pg_slema/custom_icons_icons.dart';

class CalendarMoveBackward extends StatelessWidget {
  final VoidCallback? onPressed;

  const CalendarMoveBackward({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      icon: const Icon(
        CustomIcons.arrow_left,
        shadows: [Shadow(color: Colors.transparent)],
      ),
      style: Theme.of(context).iconButtonTheme.style?.copyWith(
            iconColor: MaterialStateProperty.resolveWith((states) {
              if (!states.contains(MaterialState.disabled)) {
                return Theme.of(context).colorScheme.onPrimary;
              }
              return Theme.of(context).colorScheme.onPrimary.withOpacity(0.2);
            }),
            iconSize: const MaterialStatePropertyAll(30),
          ),
      onPressed: onPressed,
    );
  }
}
