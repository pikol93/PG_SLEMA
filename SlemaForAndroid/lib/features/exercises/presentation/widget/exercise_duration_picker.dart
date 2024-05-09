import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_duration.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';
import 'package:pg_slema/utils/widgets/enum_slider.dart';

class ExerciseDurationPicker extends StatefulWidget {
  final ValueChanged<ExerciseDuration> onDurationChanged;
  final ExerciseDuration? initialValue;

  const ExerciseDurationPicker({
    super.key,
    required this.onDurationChanged,
    this.initialValue,
  });

  @override
  State<ExerciseDurationPicker> createState() => _ExerciseDurationPickerState();
}

class _ExerciseDurationPickerState extends State<ExerciseDurationPicker> {
  late ExerciseDuration _exerciseDuration;

  @override
  void initState() {
    super.initState();
    _exerciseDuration = widget.initialValue ?? ExerciseDuration.upTo15;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      shadow: false,
      child: Column(
        children: [
          Text(
            "Czas trwania",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const ContainerDivider(),
          Text(
            _exerciseDuration.textRepresentation,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          EnumSlider<ExerciseDuration>(
            values: ExerciseDuration.values,
            initialValue: _exerciseDuration,
            onValueChanged: _onChanged,
          ),
        ],
      ),
    );
  }

  void _onChanged(ExerciseDuration value) {
    setState(() {
      _exerciseDuration = value;
    });

    widget.onDurationChanged(_exerciseDuration);
  }
}
