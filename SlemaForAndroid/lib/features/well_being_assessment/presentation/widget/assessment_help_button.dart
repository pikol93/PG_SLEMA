import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentHelpButton extends StatelessWidget with Logger {
  const AssessmentHelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        logger.debug("Button not implemented yet.");
      },
      icon: const Icon(
        Icons.question_mark_rounded,
        color: Colors.white,
      ),
    );
  }
}
