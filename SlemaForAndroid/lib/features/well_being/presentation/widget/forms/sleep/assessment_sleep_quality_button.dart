import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_quality.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSleepQualityButton extends StatelessWidget with Logger {
  const AssessmentSleepQualityButton(
      {super.key, required this.sleepQuality, required this.onPressed});

  final SleepQuality sleepQuality;
  final Function(SleepQuality) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  void onButtonPressed() {
    logger.debug("Clicked sleep quality button: \"$sleepQuality\"");
    onPressed(sleepQuality);
  }
}
