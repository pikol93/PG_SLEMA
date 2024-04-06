import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/settings/presentation/widget/setting_button.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:provider/provider.dart';

class RemoveAssessmentsSettingButton extends StatelessWidget with Logger {
  const RemoveAssessmentsSettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingButton(
      label: "Usuń dane raportów",
      alertDialogTitle: "Czy usunąć dane raportów?",
      alertDialogContent: "",
      onConfirmPressed: () => onConfirmPressed(context),
    );
  }

  void onConfirmPressed(BuildContext context) {
    logger.debug("Confirm pressed.");
    Provider.of<AssessmentsService>(context, listen: false)
        .clearAllAssessments();
  }
}
