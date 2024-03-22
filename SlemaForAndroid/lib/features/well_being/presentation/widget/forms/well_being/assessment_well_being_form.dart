import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/well_being/assessment_well_being_selector.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentWellBeingForm extends StatelessWidget with Logger {
  const AssessmentWellBeingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AssessmentFormTitle(title: "Samopoczucie"),
        ContainerDivider(),
        AssessmentWellBeingSelector(),
      ],
    );
  }
}