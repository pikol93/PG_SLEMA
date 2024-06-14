import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_duration.dart';
import 'package:pg_slema/features/exercises/logic/entity/enum/exercise_intensity.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_duration_picker.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_intensity_picker.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/features/exercises/presentation/controller/add_exercise_controller.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/forms/save_button.dart';
import 'package:pg_slema/utils/widgets/forms/text_input.dart';
import 'package:pg_slema/utils/widgets/date_picker/date_picker.dart';
import 'package:pg_slema/utils/widgets/time_of_day_picker/time_of_day_picker.dart';

class ExerciseScreen extends StatefulWidget {
  final ValueChanged<Exercise> onExerciseSaved;
  final Exercise? exercise;

  const ExerciseScreen({
    super.key,
    required this.onExerciseSaved,
    this.exercise,
  });

  @override
  State<StatefulWidget> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _exerciseController = AddExerciseController();

  late String _title;

  @override
  void initState() {
    super.initState();

    if (widget.exercise != null) {
      final exercise = widget.exercise!;
      _title = "Edytuj ćwiczenie";
      _exerciseController.initFromExercise(exercise);
    } else {
      _title = "Dodaj ćwiczenie";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultAppBar(title: _title),
        DefaultBody(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                CustomTextFormField(
                  label: "Rodzaj aktywności",
                  icon: Icons.sports_gymnastics,
                  onChanged: _onNameChanged,
                  initialValue: _exerciseController.name,
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: DatePicker(
                        label: "Data ćwiczenia",
                        onDateSelected: _onDateChanged,
                        controller: DatePickerController(
                          allowedFirstDate: DateTime.now()
                              .subtract(const Duration(days: 3650)),
                          allowedLastDate: DateTime.now(),
                          initialDate: _exerciseController.exerciseDate,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Expanded(
                      child: TimeOfDayPicker(
                        onTimeSelected: _onTimeChanged,
                        initialValue: _exerciseController.exerciseTime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ExerciseDurationPicker(
                  onDurationChanged: _onDurationChanged,
                  initialValue: _exerciseController.exerciseDuration,
                ),
                const SizedBox(height: 20.0),
                ExerciseIntensityPicker(
                  onIntensityChanged: _onIntensityChanged,
                  initialValue: _exerciseController.intensity,
                ),
                const SizedBox(height: 20.0),
                CustomSaveButton(
                  formKey: _formKey,
                  onSaved: _onSaveButtonClicked,
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _onNameChanged(String name) {
    _exerciseController.name = name.trim();
  }

  void _onDateChanged(DateTime dateTime) {
    _exerciseController.exerciseDate = dateTime;
  }

  void _onTimeChanged(TimeOfDay timeOfDay) {
    _exerciseController.exerciseTime = timeOfDay;
  }

  void _onDurationChanged(ExerciseDuration duration) {
    _exerciseController.exerciseDuration = duration;
  }

  void _onIntensityChanged(ExerciseIntensity intensity) {
    _exerciseController.intensity = intensity;
  }

  void _onSaveButtonClicked() {
    var exercise = _exerciseController.createExercise();
    widget.onExerciseSaved(exercise);
  }
}
