import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/features/exercises/presentation/controller/add_exercise_controller.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/forms/save_button.dart';
import 'package:pg_slema/utils/widgets/forms/text_input.dart';

import '../../../../utils/widgets/date_picker/date_picker.dart';

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
    return Column(
      children: [
        const DefaultAppBar(title: "Dodaj ćwiczenie"),
        DefaultBody(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  label: "Rodzaj aktywności",
                  icon: Icons.sports_gymnastics,
                  onChanged: (val) => _controller.name = val,
                ),
                CustomSaveButton(
                  formKey: _formKey,
                  onSaved: _onSaveButtonClicked,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _onSaveButtonClicked() {
    var exercise = _controller.createExercise();
    widget.onExerciseAdded(exercise);
  }
}
