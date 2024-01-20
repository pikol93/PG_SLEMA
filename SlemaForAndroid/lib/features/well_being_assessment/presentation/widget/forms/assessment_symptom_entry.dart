import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/assessment_subtitle_text.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/assessment_symptoms_change_value_button.dart';

class AssessmentSymptomEntry extends StatelessWidget {
  const AssessmentSymptomEntry({super.key, required this.symptomName});

  final String symptomName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssessmentSubtitleText(text: symptomName),
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
                constraints: const BoxConstraints(
                    minHeight: 16, minWidth: 16, maxHeight: 64, maxWidth: 64),
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

  void onDecreasePressed() {}

  void onIncreasePressed() {}
}
