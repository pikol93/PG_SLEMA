import 'package:flutter/material.dart';

class CalendarMoveForward extends StatelessWidget {
  final VoidCallback onPressed;

  const CalendarMoveForward({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.arrow_forward,
        shadows: [Shadow(color: Colors.transparent)],
      ),
      style: Theme.of(context).iconButtonTheme.style?.copyWith(
            iconColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.onPrimary),
            iconSize: const MaterialStatePropertyAll(30),
          ),
      onPressed: onPressed,
    );
  }
}
