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
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
