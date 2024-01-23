import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_subtitle_text.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/assessment_symptoms_change_value_button.dart';
import 'package:pg_slema/features/well_being_assessment/data/symptom_type.dart';
import 'package:pg_slema/features/well_being_assessment/data/symptom_value.dart';

class AssessmentSymptomEntry extends StatelessWidget {
  final SymptomType symptomType;
  final SymptomValue symptomValue;
  final Function(int) decreasePressed;
  final Function(int) increasePressed;

  const AssessmentSymptomEntry(
      {super.key,
      required this.symptomType,
      required this.symptomValue,
      required this.decreasePressed,
      required this.increasePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssessmentSubtitleText(text: symptomType.name),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssessmentSymptomsChangeValueButton(
              onPressed: onDecreasePressed,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 16),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.elliptical(8, 8)),
                  child: LinearProgressIndicator(
                    value: symptomValue.valueRepresentation,
                    color: symptomValue.colorRepresentation,
                  ),
                ),
              ),
            ),
            AssessmentSymptomsChangeValueButton(
              onPressed: onIncreasePressed,
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              symptomValue.textRepresentation,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ],
    );
  }

  void onDecreasePressed() {
    decreasePressed(symptomType.id);
  }

  void onIncreasePressed() {
    increasePressed(symptomType.id);
  }
}
