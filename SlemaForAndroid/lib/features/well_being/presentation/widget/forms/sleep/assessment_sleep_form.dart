import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_duration.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_quality.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_form_duration_section.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_form_quality_section.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepForm extends StatelessWidget with Logger {
  final Assessment assessment;
  final void Function(Assessment Function(Assessment p1) mutateFunction)
      onDataChanged;

  const AssessmentSleepForm({
    super.key,
    required this.assessment,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AssessmentFormTitle(title: "Sen"),
        const ContainerDivider(),
        AssessmentSleepFormDurationSection(
          sleepDuration: assessment.sleepDuration,
          onSleepDurationSelected: onSleepDurationSelected,
        ),
        const ContainerDivider(),
        AssessmentSleepFormQualitySection(
            sleepQuality: assessment.sleepQuality,
            onSleepQualitySelected: onSleepQualitySelected),
      ],
    );
  }

  void onSleepDurationSelected(SleepDuration sleepDuration) {
    logger.debug("Set sleep duration: $sleepDuration");
    onDataChanged((assessment) {
      return assessment.copyWith(sleepDuration: sleepDuration);
    });
  }

  void onSleepQualitySelected(SleepQuality sleepQuality) {
    logger.debug("Set sleep quality: $sleepQuality");
    onDataChanged((assessment) {
      return assessment.copyWith(sleepQuality: sleepQuality);
    });
  }
}
