import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_intensity.dart';
import 'package:pg_slema/features/exercises/presentation/widget/partial/line_slider_tick_mark_shape.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';
import 'package:pg_slema/utils/widgets/enum_slider.dart';

class ExerciseIntensityPicker extends StatefulWidget {
  final ValueChanged<ExerciseIntensity> onIntensityChanged;
  final ExerciseIntensity? initialValue;

  const ExerciseIntensityPicker({
    super.key,
    required this.onIntensityChanged,
    this.initialValue,
  });

  @override
  State<ExerciseIntensityPicker> createState() =>
      _ExerciseIntensityPickerState();
}

class _ExerciseIntensityPickerState extends State<ExerciseIntensityPicker> {
  late ExerciseIntensity _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue ?? ExerciseIntensity.veryGentle;
  }

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
            _currentValue.labelTextRepresentation,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: _currentValue.colorRepresentationLerp(),
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
                child: EnumSlider<ExerciseIntensity>(
                  values: ExerciseIntensity.values,
                  initialValue: _currentValue,
                  onValueChanged: _onIntensityChanged,
                ),
              ),
            ),
          ),
          Text(
            _currentValue.textRepresentation,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  void _onIntensityChanged(ExerciseIntensity value) {
    setState(() {
      _currentValue = value;
    });

    widget.onIntensityChanged(value);
  }
}
