import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/symptom_entry.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/symptoms/assessment_symptom_entry.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSymptomsEntriesContainer extends StatelessWidget with Logger {
  final Assessment assessment;
  final void Function(String symptomName) onSymptomIncreasePressed;
  final void Function(String symptomName) onSymptomDecreasePressed;

  const AssessmentSymptomsEntriesContainer({
    super.key,
    required this.assessment,
    required this.onSymptomIncreasePressed,
    required this.onSymptomDecreasePressed,
  });

  @override
  Widget build(BuildContext context) {
    List<SymptomEntry> entries = assessment.symptomEntries.symptomEntries;
    List<Widget> children = [];

    // Insert a divider between every symptom entry
    for (final (index, entry) in entries.indexed) {
      children.add(AssessmentSymptomEntry(
        symptomEntry: entry,
        decreasePressed: onSymptomDecreasePressed,
        increasePressed: onSymptomIncreasePressed,
      ));

      if (index < entries.length - 1) {
        children.add(const ContainerDivider());
      }
    }

    return Column(
      children: children,
    );
  }
}
