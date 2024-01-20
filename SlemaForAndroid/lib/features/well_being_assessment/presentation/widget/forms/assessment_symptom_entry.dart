import 'package:flutter/material.dart';

class AssessmentSymptomEntry extends StatelessWidget {
  const AssessmentSymptomEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "asd",
              textAlign: TextAlign.center,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onDecreasePressed,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    minHeight: 16, minWidth: 16, maxHeight: 64, maxWidth: 64),
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                  child: LinearProgressIndicator(value: 0.5),
                ),
              ),
            ),
            IconButton(
              onPressed: onIncreasePressed,
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "qwe",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ],
    );
  }

  void onDecreasePressed() {}

  void onIncreasePressed() {}
}
