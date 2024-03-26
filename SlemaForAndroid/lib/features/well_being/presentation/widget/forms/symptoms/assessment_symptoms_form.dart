import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_value.dart';
import 'package:pg_slema/features/well_being/presentation/screen/modify_symptoms_screen.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_button.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/symptoms/assessment_symptoms_entries_container.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSymptomsFormWidget extends StatelessWidget with Logger {
  final Assessment assessment;
  final void Function(Assessment Function(Assessment)) onDataChanged;

  const AssessmentSymptomsFormWidget({
    super.key,
    required this.assessment,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AssessmentFormTitle(title: "Symptomy"),
        const ContainerDivider(),
        AssessmentSymptomsEntriesContainer(
          assessment: assessment,
          onSymptomIncreasePressed: onIncreasePressed,
          onSymptomDecreasePressed: onDecreasePressed,
        ),
        const ContainerDivider(),
        AssessmentButton(
          text: "DODAJ/USUŃ",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ModifySymptomsScreen(
                  assessment: assessment,
                  onDataChanged: onDataChanged,
                );
              }),
            );
          },
        ),
      ],
    );
  }

  void onIncreasePressed(String name) {
    SymptomEntry? entry = assessment.symptomEntries.findEntryByName(name);
    if (entry == null) {
      logger.error(
          "Could not find entry by name \"$name\". This should not happen.");
      return;
    }

    SymptomValue value = entry.value.increased;
    SymptomEntry newEntry = entry.copyWith(value: value);
    SymptomEntries newEntries =
        assessment.symptomEntries.copyWithReplacedEntry(newEntry);
    onDataChanged((assessment) {
      return assessment.copyWith(symptomEntries: newEntries);
    });
  }

  void onDecreasePressed(String name) {
    SymptomEntry? entry = assessment.symptomEntries.findEntryByName(name);
    if (entry == null) {
      logger.error(
          "Could not find entry by name \"$name\". This should not happen.");
      return;
    }

    SymptomValue value = entry.value.decreased;
    SymptomEntry newEntry = entry.copyWith(value: value);
    SymptomEntries newEntries =
        assessment.symptomEntries.copyWithReplacedEntry(newEntry);
    onDataChanged((assessment) {
      return assessment.copyWith(symptomEntries: newEntries);
    });
  }
}
