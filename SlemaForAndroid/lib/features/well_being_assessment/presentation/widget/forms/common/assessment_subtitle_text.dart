import 'package:flutter/cupertino.dart';

class AssessmentSubtitleText extends StatelessWidget {
  final String text;

  const AssessmentSubtitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
