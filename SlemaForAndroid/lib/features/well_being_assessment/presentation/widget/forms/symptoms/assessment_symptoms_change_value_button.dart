import 'package:flutter/material.dart';

class AssessmentSymptomsChangeValueButton extends StatelessWidget {
  const AssessmentSymptomsChangeValueButton(
      {super.key, required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      constraints: const BoxConstraints(),
    );
  }
}
