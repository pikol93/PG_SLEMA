import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_subtitle_text.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/assessment_symptoms_change_value_button.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/symptom_type.dart';

class AssessmentSymptomEntry extends StatelessWidget {
  const AssessmentSymptomEntry(
      {super.key,
      required this.symptom,
      required this.decreasePressed,
      required this.increasePressed});

  final SymptomType symptom;
  final Function(int) decreasePressed;
  final Function(int) increasePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssessmentSubtitleText(text: symptom.name),
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
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                  child: LinearProgressIndicator(value: 0.5),
                ),
              ),
            ),
            AssessmentSymptomsChangeValueButton(
              onPressed: onIncreasePressed,
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "qwe",
              textAlign: TextAlign.center,
            )
          ],
        ),
      ],
    );
  }

  void onDecreasePressed() {
    decreasePressed(symptom.id);
  }

  void onIncreasePressed() {
    increasePressed(symptom.id);
  }
}
