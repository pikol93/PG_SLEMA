import 'package:flutter/material.dart';

class AssessmentWellBeingSelectorVariant extends StatelessWidget {
  const AssessmentWellBeingSelectorVariant(
      {super.key, required this.icon, required this.onPressed});

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.arrow_drop_down)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_drop_up),
            ],
          ),
        ],
      ),
    );
  }
}
