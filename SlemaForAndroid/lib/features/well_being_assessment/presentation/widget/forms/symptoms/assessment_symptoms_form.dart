import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_form_divider.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/assessment_manage_symptoms_button.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/assessment_symptom_entry.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSymptomsFormWidget extends StatelessWidget with Logger {
  const AssessmentSymptomsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AssessmentFormTitle(title: "Symptomy"),
        AssessmentFormDivider(),
        AssessmentSymptomEntry(symptomName: "Zmiany skórne"),
        AssessmentFormDivider(),
        AssessmentSymptomEntry(
          symptomName: "Ból stawów",
        ),
        AssessmentFormDivider(),
        AssessmentSymptomEntry(
          symptomName: "Mdłości",
        ),
        AssessmentFormDivider(),
        AssessmentManageSymptomsButton(),
      ],
    );
  }
}
