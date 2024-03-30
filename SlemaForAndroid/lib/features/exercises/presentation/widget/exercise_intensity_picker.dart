import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_intensity.dart';
import 'package:pg_slema/features/exercises/presentation/widget/partial/exercise_intensity_slider.dart';
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
  String _label = ExerciseIntensity.veryGentle.labelTextRepresentation;
  String _text = ExerciseIntensity.veryGentle.textRepresentation;

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
            _label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          ExerciseIntensitySlider(onSliderChanged: _onIntensityChanged),
          Text(
            _text,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  void _onIntensityChanged(double sliderValue) {
    widget.onIntensityChanged(
        sliderValue.toExerciseIntensity().intRepresentation);

    setState(() {
      _label = sliderValue.toExerciseIntensity().labelTextRepresentation;
      _text = sliderValue.toExerciseIntensity().textRepresentation;
    });
  }
}
