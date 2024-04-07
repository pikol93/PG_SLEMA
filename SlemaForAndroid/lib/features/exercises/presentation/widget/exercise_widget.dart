import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/utils/date/date.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class ExerciseWidget extends StatelessWidget {
  static const double dateIconSize = 48.0;
  static const double dateTextHeightOverride = 0.5;
  static const double dateIconValuesHorizontalSpacing = 12.0;
  static const double topOffsetDateValues = dateIconSize / 6.0;
  static const double spacingBetweenDateValues = 8.0;
  static const double spacingBetweenDataValues = 16.0;

  final Exercise exercise;

  const ExerciseWidget({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    TextStyle keyStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          height: dateTextHeightOverride,
          fontWeight: FontWeight.w800,
        );
    TextStyle valueStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          height: dateTextHeightOverride,
          fontWeight: FontWeight.w400,
        );

    return DefaultContainer(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDateTimeRow(context, keyStyle, valueStyle),
            const Divider(height: 24.0, thickness: 2.0),
            buildDataRow(context, keyStyle, valueStyle),
          ],
        ),
      ),
    );
  }

  Widget buildDateTimeRow(
    BuildContext context,
    TextStyle keyStyle,
    TextStyle valueStyle,
  ) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
          child: Icon(
            Icons.calendar_today_outlined,
            size: dateIconSize,
          ),
        ),
        const SizedBox(
          width: dateIconValuesHorizontalSpacing,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: topOffsetDateValues),
            Row(
              children: [
                Text("Data:", style: keyStyle),
                Text(exercise.exerciseDate.toDateString(), style: valueStyle),
              ],
            ),
            const SizedBox(height: spacingBetweenDateValues),
            Row(
              children: [
                Text("Godzina:", style: keyStyle),
                Text(exercise.exerciseTime.format(context), style: valueStyle),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget buildDataRow(
    BuildContext context,
    TextStyle keyStyle,
    TextStyle valueStyle,
  ) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Nazwa:", style: keyStyle),
                Text(exercise.name, style: valueStyle),
              ],
            ),
            const SizedBox(height: spacingBetweenDataValues),
            Row(
              children: [
                Text("Czas trwania:", style: keyStyle),
                Text("TODO", style: valueStyle),
              ],
            ),
            const SizedBox(height: spacingBetweenDataValues),
            Row(
              children: [
                Text("Intensywność:", style: keyStyle),
                Text("TODO", style: valueStyle),
              ],
            ),
          ],
        )
      ],
    );
  }
}
