import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/well_being/assessment_well_being_selector.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentWellBeingForm extends StatelessWidget with Logger {
  final Assessment assessment;
  final void Function(Assessment Function(Assessment)) onDataChanged;

  const AssessmentWellBeingForm({
    super.key,
    required this.assessment,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AssessmentFormTitle(title: "Samopoczucie"),
        const ContainerDivider(),
        AssessmentWellBeingSelector(
          assessment: assessment,
          onDataChanged: onDataChanged,
        ),
      ],
    );
  }
}
