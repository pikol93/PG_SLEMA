import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/presentation/controller/add_exercise_controller.dart';
import 'package:pg_slema/features/exercises/presentation/widget/form_widgets/save_button.dart';
import 'package:pg_slema/features/exercises/presentation/widget/form_widgets/text_input.dart';
import 'package:pg_slema/features/notification/presentation/controller/time_picker_controller.dart';
import 'package:pg_slema/features/notification/presentation/widget/time_picker.dart';
import 'package:pg_slema/utils/simple_appbar/simple_appbar.dart';

class AddExerciseScreen extends StatefulWidget {
  final ValueChanged<Exercise> onExerciseAdded;

  const AddExerciseScreen({super.key, required this.onExerciseAdded});

  @override
  State<StatefulWidget> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final _controller = AddExerciseController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SimpleAppbar(title: "Dodaj ćwiczenie"),
        body: Form(
            key: _formKey,
            child: Column(children: [
              CustomTextFormField(
                  label: "Nazwa",
                  icon: Icons.co2,
                  onChanged: (val) => _controller.name = val),
              TextFormField(
                  keyboardType: TextInputType
                      .number, //TODO: its temporary, it allows to use decimal/
                  // it should be changed to bar with range 0-100
                  onChanged: (duration) =>
                      _controller.intensity = int.parse(duration)),
              TextFormField(
                  keyboardType: TextInputType
                      .number, //TODO: its temporary, it allows to use decimal
                  onChanged: (duration) =>
                      _controller.exerciseDuration = int.parse(duration)),
              CustomTimePicker(
                  onTimeChanged: (time) => (_controller.exerciseTime = time),
                  controller: TimePickerController(_controller.exerciseTime)),
              //TODO: add date picker and move it with timepicker to utils
              CustomSaveButton(onSaveButtonClicked: _onSaveButtonClicked)
            ])));
  }

  void _onSaveButtonClicked() {
    var exercise = _controller.createExercise();
    widget.onExerciseAdded(exercise);
  }
}
