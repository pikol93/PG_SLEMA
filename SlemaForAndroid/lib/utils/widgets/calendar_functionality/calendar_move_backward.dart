import 'package:flutter/material.dart';

class CalendarMoveBackward extends StatelessWidget {
  final VoidCallback onPressed;

  const CalendarMoveBackward({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: onPressed,
    );
  }
}
