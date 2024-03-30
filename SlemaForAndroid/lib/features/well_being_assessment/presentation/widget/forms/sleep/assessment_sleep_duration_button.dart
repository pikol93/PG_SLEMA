import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/logic/entity/enum/sleep_duration.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepDurationButton extends StatelessWidget with Logger {
  final SleepDuration sleepDuration;
  final Function(SleepDuration) onPressed;

  const AssessmentSleepDurationButton(
      {super.key, required this.sleepDuration, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AssessmentButton(
      text: sleepDuration.buttonTextRepresentation,
      onPressed: onButtonPressed,
    );
  }

  void onButtonPressed() {
    logger.debug("Clicked sleep duration button: \"$sleepDuration\"");
    onPressed(sleepDuration);
  }
}
