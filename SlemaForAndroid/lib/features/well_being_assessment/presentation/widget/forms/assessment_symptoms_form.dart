import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/assessment_form_divider.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/assessment_form_title.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSymptomsFormWidget extends StatelessWidget with Logger {
  const AssessmentSymptomsFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssessmentFormTitle(title: "Symptomy"),
        AssessmentFormDivider(),
        AssessmentSymptomEntry(),
        AssessmentFormDivider(),
        AssessmentSymptomEntry(),
        AssessmentFormDivider(),
        AssessmentSymptomEntry(),
        AssessmentFormDivider(),
        AssessmentManageSymptomsButton(),
      ],
    );
  }
}

class AssessmentManageSymptomsButton extends StatelessWidget with Logger {
  const AssessmentManageSymptomsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AssessmentButton(text: "DODAJ/USUŃ", onPressed: onPressed);
  }

  void onPressed() {
    logger.warning("I am not implemented yet.");
  }
}

class AssessmentButton extends StatelessWidget {
  const AssessmentButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.minimumSize = const Size(48, 16),
    this.textStyle = const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
  });

  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Size minimumSize;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          minimumSize: minimumSize,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

class AssessmentSymptomEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "asd",
              textAlign: TextAlign.center,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onDecreasePressed,
              icon: Icon(Icons.remove_circle_outline),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: 16, minWidth: 16, maxHeight: 64, maxWidth: 64),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
                  child: LinearProgressIndicator(value: 0.5),
                ),
              ),
            ),
            IconButton(
              onPressed: onIncreasePressed,
              icon: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
        Row(
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
