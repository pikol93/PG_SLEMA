import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/assessment_screen.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AddAssessmentButton extends StatelessWidget with Logger {
  const AddAssessmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onButtonPressed(context);
      },
      child: const Icon(Icons.add),
    );
  }

  void onButtonPressed(BuildContext context) {
    logger.debug("Add assessment button pressed");

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AssessmentScreen(),
        ));
  }
}
