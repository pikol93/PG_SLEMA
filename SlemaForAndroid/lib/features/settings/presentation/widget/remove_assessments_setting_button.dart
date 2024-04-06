import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/settings/presentation/widget/setting_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class RemoveAssessmentsSettingButton extends StatelessWidget with Logger {
  const RemoveAssessmentsSettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingButton(
      label: "Usuń dane raportów",
      alertDialogTitle: "Czy usunąć dane raportów?",
      alertDialogContent: "",
      onConfirmPressed: onConfirmPressed,
    );
  }

  void onConfirmPressed() {
    logger.debug("Confirm pressed.");
  }
}
