import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentFormTitle extends StatelessWidget with Logger {
  final String title;

  const AssessmentFormTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
