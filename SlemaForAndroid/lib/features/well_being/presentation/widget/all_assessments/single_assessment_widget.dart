import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_duration.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_quality.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_value.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';
import 'package:pg_slema/features/well_being/presentation/screen/assessment_screen.dart';
import 'package:pg_slema/utils/date/date.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class SingleAssessmentWidget extends StatefulWidget {
  final Assessment assessment;

  const SingleAssessmentWidget({
    super.key,
    required this.assessment,
  });

  @override
  State<StatefulWidget> createState() => SingleAssessmentWidgetState();
}

class SingleAssessmentWidgetState extends State<SingleAssessmentWidget>
    with Logger {
  static const double sectionTextHeightOverride = 1;
  static const double dataTextHeightOverride = 0.75;

  BuildContext? buildContext;

  @override
  Widget build(BuildContext context) {
    buildContext = context;

    TextStyle keyStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          height: sectionTextHeightOverride,
          fontWeight: FontWeight.w800,
        );

    return DefaultContainer(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          _buildDateRow(keyStyle),
          const Divider(height: 8.0, thickness: 2.0),
          _buildSymptomsRow(keyStyle),
          const Divider(height: 8.0, thickness: 2.0),
          _buildSleepRow(keyStyle),
        ],
      ),
    );
  }

  Widget _buildDateRow(
    TextStyle sectionTextStyle,
  ) {
    final TextStyle dateTextStyle =
        Theme.of(context).textTheme.labelLarge!.copyWith(
              height: dataTextHeightOverride,
              fontWeight: FontWeight.w500,
            );

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                "Data:",
                style: sectionTextStyle,
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.assessment.intakeDate.toDateString(),
                style: dateTextStyle,
              ),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 32.0,
              child: widget.assessment.wellBeing.icon,
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: _onEditPressed,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSymptomsRow(
    TextStyle sectionTextStyle,
  ) {
    final TextStyle symptomNameTextStyle =
        Theme.of(context).textTheme.labelMedium!.copyWith(
              height: dataTextHeightOverride,
              fontWeight: FontWeight.w500,
            );
    final TextStyle symptomValueTextStyle =
        Theme.of(context).textTheme.labelMedium!.copyWith(
              height: dataTextHeightOverride,
              fontWeight: FontWeight.w300,
            );

    final symptoms = widget.assessment.symptomEntries.symptomEntries
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.name,
                  style: symptomNameTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    e.value.textRepresentation,
                    style: symptomValueTextStyle,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList(growable: false);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Symptomy",
                style: sectionTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: symptoms,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSleepRow(
    TextStyle sectionTextStyle,
  ) {
    return Row(
      children: [
        Text(
          "Sen",
          style: sectionTextStyle,
        ),
        const SizedBox(width: 16.0),
        Row(
          children: [
            _buildSleepContainer(
              widget.assessment.sleepDuration.buttonTextRepresentation,
            ),
            const SizedBox(width: 8.0),
            _buildSleepContainer(
              widget.assessment.sleepQuality.buttonSubtitleTextRepresentation,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSleepContainer(
    String text,
  ) {
    final TextStyle symptomValueTextStyle =
        Theme.of(context).textTheme.labelSmall!.copyWith(
              height: dataTextHeightOverride,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primaryContainer,
            );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Text(text, style: symptomValueTextStyle),
      ),
    );
  }

  void _onEditPressed() {
    logger.debug("Edit pressed for assessment: ${widget.assessment.id}");
    Navigator.push(
      buildContext!,
      MaterialPageRoute(
        builder: (context) {
          return AssessmentScreen(
            assessment: widget.assessment,
            isModification: true,
          );
        },
      ),
    );
  }
}
