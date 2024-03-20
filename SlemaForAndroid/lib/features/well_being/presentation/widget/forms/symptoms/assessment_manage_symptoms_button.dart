import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_button.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentManageSymptomsButton extends StatelessWidget with Logger {
  const AssessmentManageSymptomsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AssessmentButton(text: "DODAJ/USUŃ", onPressed: onPressed);
  }

  void onPressed() {
    logger.warning("I am not implemented yet.");
  }
}
