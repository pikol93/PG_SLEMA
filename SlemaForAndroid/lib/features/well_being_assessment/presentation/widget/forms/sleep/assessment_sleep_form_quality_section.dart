import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/sleep/assessment_sleep_quality_buttons_row.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_subtitle_text.dart';

class AssessmentSleepFormQualitySection extends StatelessWidget {
  const AssessmentSleepFormQualitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AssessmentSubtitleText(text: "Ocena jakości snu"),
        AssessmentSleepQualityButtonsRow(),
      ],
    );
  }
}
