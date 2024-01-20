import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_button.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/sleep/sleep_quality.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepQualityButton extends StatelessWidget with Logger {
  const AssessmentSleepQualityButton(
      {super.key, required this.sleepQuality, required this.onPressed});

  final SleepQuality sleepQuality;
  final Function(SleepQuality) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssessmentButton(
            text: sleepQuality.buttonTextRepresentation,
            onPressed: onButtonPressed,
            minimumSize: const Size(48, 48),
            boxColor: sleepQuality.colorRepresentation,
          ),
          Text(
            sleepQuality.buttonSubtitleTextRepresentation,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void onButtonPressed() {
    logger.debug("Clicked sleep quality button: \"$sleepQuality\"");
    onPressed(sleepQuality);
  }
}
