import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/exercises/logic/service/exercise_service.dart';
import 'package:pg_slema/features/settings/presentation/widget/setting_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:provider/provider.dart';

class RemoveExercisesSettingButton extends StatelessWidget with Logger {
  const RemoveExercisesSettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingButton(
      label: "Usuń dane ćwiczeń",
      alertDialogTitle: "Czy usunąć dane ćwiczeń?",
      alertDialogContent: "",
      onConfirmPressed: () => onConfirmPressed(context),
    );
  }

  void onConfirmPressed(BuildContext context) {
    logger.debug("Remove exercises confirm button pressed.");
    Provider.of<ExerciseService>(context, listen: false).deleteAllExercises();
  }
}
