import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_duration_buttons_row.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_subtitle_text.dart';

class AssessmentSleepFormDurationSection extends StatelessWidget {
  const AssessmentSleepFormDurationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AssessmentSubtitleText(text: "Czas snu zeszłej nocy"),
        AssessmentSleepDurationButtonsRow(),
      ],
    );
  }
}
