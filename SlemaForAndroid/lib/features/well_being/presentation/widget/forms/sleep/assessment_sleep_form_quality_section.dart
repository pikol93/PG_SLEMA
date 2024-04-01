import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_quality.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_quality_buttons_row.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_subtitle_text.dart';

class AssessmentSleepFormQualitySection extends StatelessWidget {
  final SleepQuality sleepQuality;
  final void Function(SleepQuality sleepQuality) onSleepQualitySelected;

  const AssessmentSleepFormQualitySection({
    super.key,
    required this.sleepQuality,
    required this.onSleepQualitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AssessmentSubtitleText(text: "Ocena jakości snu"),
        AssessmentSleepQualityButtonsRow(
          sleepQuality: sleepQuality,
          onSleepQualitySelected: onSleepQualitySelected,
        ),
      ],
    );
  }
}
