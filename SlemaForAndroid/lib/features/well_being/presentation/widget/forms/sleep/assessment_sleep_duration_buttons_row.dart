import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_duration.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_duration_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepDurationButtonsRow extends StatelessWidget with Logger {
  final SleepDuration sleepDuration;
  final void Function(SleepDuration sleepDuration) onSleepDurationSelected;

  const AssessmentSleepDurationButtonsRow({
    super.key,
    required this.sleepDuration,
    required this.onSleepDurationSelected,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Display selected value.
    var rowChildren = SleepDuration.values
        .map((e) => Expanded(
              child: AssessmentSleepDurationButton(
                sleepDuration: e,
                onPressed: onSleepDurationSelected,
              ),
            ))
        .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: rowChildren,
    );
  }
}
