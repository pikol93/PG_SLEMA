import 'package:flutter/material.dart';

class AssessmentSymptomsChangeValueButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;

  const AssessmentSymptomsChangeValueButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }
}
