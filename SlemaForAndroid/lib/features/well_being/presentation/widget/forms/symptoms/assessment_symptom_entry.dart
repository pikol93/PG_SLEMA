import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_value.dart';
import 'package:pg_slema/features/well_being/logic/entity/symptom_entry.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_subtitle_text.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/symptoms/assessment_symptoms_change_value_button.dart';

class AssessmentSymptomEntry extends StatelessWidget {
  final SymptomEntry symptomEntry;
  final Function(String) decreasePressed;
  final Function(String) increasePressed;

  const AssessmentSymptomEntry({
    super.key,
    required this.symptomEntry,
    required this.decreasePressed,
    required this.increasePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssessmentSubtitleText(text: symptomEntry.name),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssessmentSymptomsChangeValueButton(
              onPressed: onDecreasePressed,
              icon: Icon(
                Icons.remove_circle_outline,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 16),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.elliptical(8, 8)),
                  child: LinearProgressIndicator(
                    value: symptomEntry.value.valueRepresentation,
                    color: symptomEntry.value.colorRepresentation,
                  ),
                ),
              ),
            ),
            AssessmentSymptomsChangeValueButton(
              onPressed: onIncreasePressed,
              icon: Icon(
                Icons.add_circle_outline,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              symptomEntry.value.textRepresentation,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ],
    );
  }

  void onDecreasePressed() {
    decreasePressed(symptomEntry.name);
  }

  void onIncreasePressed() {
    increasePressed(symptomEntry.name);
  }
}
