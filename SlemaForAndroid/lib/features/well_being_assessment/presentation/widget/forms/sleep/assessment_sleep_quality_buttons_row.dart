import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/sleep/assessment_sleep_quality_button.dart';
import 'package:pg_slema/features/well_being_assessment/data/sleep_quality.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepQualityButtonsRow extends StatelessWidget with Logger {
  const AssessmentSleepQualityButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    var rowChildren = SleepQuality.values
        .map((sleepQuality) => Expanded(
          child: AssessmentSleepQualityButton(
                sleepQuality: sleepQuality,
                onPressed: onSleepQualityPressed,
              ),
        ))
        .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );
  }

  void onSleepQualityPressed(SleepQuality sleepQuality) {
    logger.debug("Chosen sleep quality $sleepQuality");
  }
}
