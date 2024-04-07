import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/settings/presentation/widget/setting_button.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
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
    // TODO: Add action
  }
}
