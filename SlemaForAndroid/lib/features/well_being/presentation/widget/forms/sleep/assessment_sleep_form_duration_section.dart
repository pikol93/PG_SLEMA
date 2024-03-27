import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_duration.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_duration_buttons_row.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_subtitle_text.dart';

class AssessmentSleepFormDurationSection extends StatelessWidget {
  final SleepDuration sleepDuration;
  final void Function(SleepDuration sleepDuration) onSleepDurationSelected;

  const AssessmentSleepFormDurationSection({
    super.key,
    required this.sleepDuration,
    required this.onSleepDurationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AssessmentSubtitleText(text: "Czas snu zeszłej nocy"),
        AssessmentSleepDurationButtonsRow(
          sleepDuration: sleepDuration,
          onSleepDurationSelected: onSleepDurationSelected,
        ),
      ],
    );
  }
}
