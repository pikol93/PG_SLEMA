import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_intensity.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class ExerciseIntensityPicker extends StatefulWidget {
  final ValueChanged<int> onIntensityChanged;
  const ExerciseIntensityPicker({super.key, required this.onIntensityChanged});

  @override
  State<ExerciseIntensityPicker> createState() =>
      _ExerciseIntensityPickerState();
}

class _ExerciseIntensityPickerState extends State<ExerciseIntensityPicker> {
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      shadow: false,
      child: Column(
        children: [
          Text(
            "Intensywność wysiłku",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const ContainerDivider(),
          Text(
            _currentSliderValue.toExerciseIntensity().labelTextRepresentation,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Slider(
            value: _currentSliderValue,
            divisions: ExerciseIntensity.values.length - 1,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
              widget.onIntensityChanged(
                  _currentSliderValue.toExerciseIntensity().intRepresentation);
            },
          ),
          Text(
            _currentSliderValue.toExerciseIntensity().textRepresentation,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
