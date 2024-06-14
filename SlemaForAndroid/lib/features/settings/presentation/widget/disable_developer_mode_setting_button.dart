import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/settings/logic/application_info_service.dart';
import 'package:pg_slema/features/settings/presentation/widget/setting_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:provider/provider.dart';

class DisableDeveloperModeSettingButton extends StatelessWidget with Logger {
  const DisableDeveloperModeSettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingButton(
      label: "Wyłącz tryb deweloperski",
      alertDialogTitle: "Czy na pewno wyłączyć tryp deweloperski?",
      alertDialogContent: "",
      onConfirmPressed: () => onConfirmPressed(context),
    );
  }

  void onConfirmPressed(BuildContext context) {
    logger.debug("Disable developer mode button clicked.");
    Provider.of<ApplicationInfoService>(context, listen: false)
        .disableDeveloperMode();
  }
}
