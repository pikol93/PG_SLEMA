import 'package:flutter/material.dart';

class CalendarMoveForward extends StatelessWidget {
  final VoidCallback onPressed;

  const CalendarMoveForward({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
      onPressed: onPressed,
    );
  }
}
