import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/symptoms/assessment_manage_symptoms_button.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/symptoms/assessment_symptoms_entries_container.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSymptomsFormWidget extends StatelessWidget with Logger {
  const AssessmentSymptomsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AssessmentFormTitle(title: "Symptomy"),
        ContainerDivider(),
        AssessmentSymptomsEntriesContainer(),
        ContainerDivider(),
        AssessmentManageSymptomsButton(),
      ],
    );
  }
}
