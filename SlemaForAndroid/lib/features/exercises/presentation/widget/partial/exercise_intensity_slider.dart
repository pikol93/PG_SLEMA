import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_intensity.dart';
import 'package:pg_slema/features/exercises/presentation/widget/partial/line_slider_tick_mark_shape.dart';

class ExerciseIntensitySlider extends StatefulWidget {
  final ValueChanged<double> onSliderChanged;
  const ExerciseIntensitySlider({super.key, required this.onSliderChanged});

  @override
  State<ExerciseIntensitySlider> createState() =>
      _ExerciseIntensitySliderState();
}

class _ExerciseIntensitySliderState extends State<ExerciseIntensitySlider> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SliderTheme(
          data: SliderThemeData(
            activeTrackColor: _currentSliderValue
                .toExerciseIntensity()
                .colorRepresentationLerp(_currentSliderValue),
            trackHeight: 40,
            inactiveTrackColor:
                Theme.of(context).colorScheme.secondaryContainer,
            thumbShape: SliderComponentShape.noOverlay,
            overlayShape: SliderComponentShape.noOverlay,
            tickMarkShape: LineSliderTickMarkShape(
              tickMarkHeight: 20,
              tickMarkOffsets: [-20, -10, 0, 10, 20],
            ),
          ),
          child: Slider(
            value: _currentSliderValue,
            divisions: ExerciseIntensity.values.length - 1,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
              widget.onSliderChanged(_currentSliderValue);
            },
          ),
        ),
      ),
    );
  }
}
