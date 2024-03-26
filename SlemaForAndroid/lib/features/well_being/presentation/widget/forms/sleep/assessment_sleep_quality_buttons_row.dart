import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_quality.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_quality_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepQualityButtonsRow extends StatelessWidget with Logger {
  final SleepQuality sleepQuality;
  final void Function(SleepQuality sleepQuality) onSleepQualitySelected;

  const AssessmentSleepQualityButtonsRow({
    super.key,
    required this.sleepQuality,
    required this.onSleepQualitySelected,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Display selected value
    var rowChildren = SleepQuality.values
        .map((sleepQuality) => Expanded(
              child: AssessmentSleepQualityButton(
                sleepQuality: sleepQuality,
                onPressed: onSleepQualitySelected,
              ),
            ))
        .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );
  }
}
