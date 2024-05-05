import 'package:flutter/material.dart';

class AssessmentSubtitleText extends StatelessWidget {
  final String text;

  const AssessmentSubtitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            softWrap: true,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
