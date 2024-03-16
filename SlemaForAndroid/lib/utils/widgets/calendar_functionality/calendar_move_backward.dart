import 'package:flutter/material.dart';

class CalendarMoveBackward extends StatelessWidget {
  final VoidCallback onPressed;

  const CalendarMoveBackward({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.arrow_back,
        shadows: [Shadow(color: Colors.transparent)],
      ),
      style: Theme.of(context).iconButtonTheme.style?.copyWith(
            iconColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.onPrimary,
            ),
            iconSize: const MaterialStatePropertyAll(30),
          ),
      onPressed: onPressed,
    );
  }
}
