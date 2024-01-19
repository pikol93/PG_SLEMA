import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentFormContainer extends StatelessWidget with Logger {
  const AssessmentFormContainer({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: child),
          ),
        ),
      ],
    );
  }
}
