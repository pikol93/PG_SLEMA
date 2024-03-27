import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/sleep/assessment_sleep_form.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/symptoms/assessment_symptoms_form.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/well_being/assessment_well_being_form.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class AssessmentScreen extends StatefulWidget {
  final Assessment assessment;
  final AssessmentsService assessmentsService;

  const AssessmentScreen({
    super.key,
    required this.assessment,
    required this.assessmentsService,
  });

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> with Logger {
  final _formKey = GlobalKey<FormState>();

  late Assessment assessment;

  @override
  void initState() {
    super.initState();

    assessment = widget.assessment;
    logger.debug("Modifying ${assessment.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultAppBar(
          title: "Dodaj raport",
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
    widget.assessmentsService.saveEntry(assessment);
    Navigator.pop(context);
  }

  void onHelpPressed() {
    logger.debug("Assessment screen help pressed");
    // TODO: Implement or consider removing
  }
}
