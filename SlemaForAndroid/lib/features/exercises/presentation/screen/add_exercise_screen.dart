import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_duration_picker.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_intensity_picker.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/features/exercises/presentation/controller/add_exercise_controller.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/forms/save_button.dart';
import 'package:pg_slema/utils/widgets/forms/text_input.dart';
import 'package:pg_slema/utils/widgets/date_picker/date_picker.dart';
import 'package:pg_slema/utils/widgets/time_of_day_picker/time_of_day_picker.dart';

class AddExerciseScreen extends StatefulWidget {
  final ValueChanged<Exercise> onExerciseAdded;
  const AddExerciseScreen({super.key, required this.onExerciseAdded});

  @override
  State<StatefulWidget> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final _exerciseController = AddExerciseController();
  final _dateController = DatePickerController(
    DateTime.now().subtract(const Duration(days: 365)),
    DateTime.now(),
    DateTime.now(),
  );

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Dodaj ćwiczenie"),
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
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: DatePicker(
                        label: "Data ćwiczenia",
                        onDateSelected: _onDateChanged,
                        controller: _dateController,
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Expanded(
                      child: TimeOfDayPicker(onTimeSelected: _onTimeChanged),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ExerciseDurationPicker(onDurationChanged: _onDurationChanged),
                const SizedBox(height: 20.0),
                ExerciseIntensityPicker(
                    onIntensityChanged: _onIntensityChanged),
                Expanded(child: Container()),
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
    _exerciseController.name = name;
  }

  void _onDateChanged(DateTime dateTime) {
    _exerciseController.exerciseDate = dateTime;
  }

  void _onTimeChanged(TimeOfDay timeOfDay) {
    _exerciseController.exerciseTime = timeOfDay;
  }

  void _onDurationChanged(int duration) {
    _exerciseController.exerciseDuration = duration;
  }

  void _onIntensityChanged(int intensity) {
    _exerciseController.intensity = intensity;
  }

  void _onSaveButtonClicked() {
    var exercise = _exerciseController.createExercise();
    widget.onExerciseAdded(exercise);
  }
}
