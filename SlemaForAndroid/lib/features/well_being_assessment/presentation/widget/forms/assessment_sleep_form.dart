import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/assessment_form_divider.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/assessment_form_title.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/assessment_sleep_form_duration_section.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/assessment_subtitle_text.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepForm extends StatelessWidget with Logger {
  const AssessmentSleepForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AssessmentFormTitle(title: "Sen"),
        AssessmentFormDivider(),
        AssessmentSleepFormDurationSection(),
        AssessmentFormDivider(),
        AssessmentSubtitleText(text: "Ocena jakości snu"),
      ],
    );
  }
}
