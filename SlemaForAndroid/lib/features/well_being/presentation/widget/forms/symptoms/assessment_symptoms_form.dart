import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/presentation/screen/modify_symptoms_screen.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_button.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/common/assessment_form_title.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/symptoms/assessment_symptoms_entries_container.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentSymptomsFormWidget extends StatelessWidget with Logger {
  final Assessment assessment;
  final void Function(Assessment Function(Assessment)) onDataChanged;

  const AssessmentSymptomsFormWidget({
    super.key,
    required this.assessment,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AssessmentFormTitle(title: "Symptomy"),
        const ContainerDivider(),
        const AssessmentSymptomsEntriesContainer(),
        const ContainerDivider(),
        AssessmentButton(
            text: "DODAJ/USUŃ",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ModifySymptomsScreen(
                    assessment: assessment,
                    onDataChanged: onDataChanged,
                  );
                }),
              );
            }),
      ],
    );
  }
}
