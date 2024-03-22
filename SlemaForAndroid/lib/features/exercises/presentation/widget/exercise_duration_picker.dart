import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_duration.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class ExerciseDurationPicker extends StatefulWidget {
  final ValueChanged<int> onDurationChanged;
  const ExerciseDurationPicker({super.key, required this.onDurationChanged});

  @override
  State<ExerciseDurationPicker> createState() => _ExerciseDurationPickerState();
}

class _ExerciseDurationPickerState extends State<ExerciseDurationPicker> {
  double _currentSliderValue = 0;
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
          Slider(
            value: _currentSliderValue,
            divisions: ExerciseDuration.values.length - 1,
            label: _currentSliderValue
                .toExerciseDuration()
                .labelTextRepresentation,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
              widget.onDurationChanged(
                  _currentSliderValue.toExerciseDuration().intRepresentation);
            },
          ),
          Text(
            _currentSliderValue.toExerciseDuration().textRepresentation,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
