import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_form_divider.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/assessment_manage_symptoms_button.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/assessment_symptom_entry.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/symptom_type.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSymptomsFormWidget extends StatelessWidget with Logger {
  const AssessmentSymptomsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AssessmentFormTitle(title: "Symptomy"),
        AssessmentFormDivider(),
        AssessmentSymptomsEntriesContainer(),
        AssessmentFormDivider(),
        AssessmentManageSymptomsButton(),
      ],
    );
  }
}

class AssessmentSymptomsEntriesContainer extends StatelessWidget with Logger {
  const AssessmentSymptomsEntriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Make these values be stored somewhere in SharedPreferences instead of being hard-coded
    const symptomsList = [
      SymptomType(id: 1, name: "Zmiany skórne"),
      SymptomType(id: 2, name: "Ból stawów"),
      SymptomType(id: 3, name: "Mdłości"),
    ];

    List<Widget> children = [];

    // Insert a divider between every symptom entry
    for (final (index, element) in symptomsList.indexed) {
      children.add(AssessmentSymptomEntry(
        symptom: element,
        decreasePressed: onDecreasePressed,
        increasePressed: onIncreasePressed,
      ));

      if (index < symptomsList.length - 1) {
        children.add(const AssessmentFormDivider());
      }
    }

    return Column(
      children: children,
    );
  }

  void onDecreasePressed(int symptomId) {
    logger.debug("Decrease pressed on symptom $symptomId");
  }

  void onIncreasePressed(int symptomId) {
    logger.debug("Increase pressed on symptom $symptomId");
  }
}
