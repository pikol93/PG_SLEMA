import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_form.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/symptoms/assessment_symptoms_form.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/well_being/assessment_well_being_form.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';
import 'package:provider/provider.dart';

class AssessmentScreen extends StatefulWidget {
  final Assessment assessment;
  final bool isModification;

  const AssessmentScreen({
    super.key,
    required this.assessment,
    required this.isModification,
  });

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> with Logger {
  final _formKey = GlobalKey<FormState>();

  late Assessment assessment;
  late String title;

  @override
  void initState() {
    super.initState();

    assessment = widget.assessment;
    title = widget.isModification ? "Modyfikuj raport" : "Dodaj raport";

    logger.debug("Modifying ${assessment.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultAppBar(
          title: title,
          leading: IconButton(
            onPressed: onBackPressed,
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
              onPressed: onHelpPressed,
              icon: const Icon(Icons.help),
            )
          ],
        ),
        DefaultBody(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  DefaultContainer(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: AssessmentWellBeingForm(
                      assessment: assessment,
                      onDataChanged: _onDataChanged,
                    ),
                  ),
                  DefaultContainer(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: AssessmentSymptomsFormWidget(
                      assessment: assessment,
                      onDataChanged: _onDataChanged,
                    ),
                  ),
                  DefaultContainer(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: AssessmentSleepForm(
                      assessment: assessment,
                      onDataChanged: _onDataChanged,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onDataChanged(Assessment Function(Assessment) mutateFunction) {
    setState(() {
      assessment = mutateFunction(assessment);
    });
  }

  void onBackPressed() {
    logger.debug("Assessment screen back button pressed");
    Provider.of<AssessmentsService>(context, listen: false)
        .saveEntry(assessment);
    Navigator.pop(context);
  }

  void onHelpPressed() {
    logger.debug("Assessment screen help pressed");
    // TODO: Implement or consider removing
  }
}
