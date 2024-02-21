import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/logic/entity/enum/sleep_duration.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/sleep/assessment_sleep_duration_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepDurationButtonsRow extends StatelessWidget with Logger {
  const AssessmentSleepDurationButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    var rowChildren = SleepDuration.values
        .map((e) => Expanded(
              child: AssessmentSleepDurationButton(
                sleepDuration: e,
                onPressed: onSleepDurationPressed,
              ),
            ))
        .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );
  }

  void onSleepDurationPressed(SleepDuration sleepDuration) {
    logger.debug("Chosen sleep duration $sleepDuration");
  }
}
