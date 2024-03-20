import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_form_duration_section.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_form_quality_section.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepForm extends StatelessWidget with Logger {
  const AssessmentSleepForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AssessmentFormTitle(title: "Sen"),
        ContainerDivider(),
        AssessmentSleepFormDurationSection(),
        ContainerDivider(),
        AssessmentSleepFormQualitySection(),
      ],
    );
  }
}
