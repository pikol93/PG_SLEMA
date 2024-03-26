import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/screen/assessment_screen.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class SingleAssessmentWidget extends StatefulWidget {
  final Assessment assessment;
  final AssessmentsService assessmentsService;

  const SingleAssessmentWidget({
    super.key,
    required this.assessment,
    required this.assessmentsService,
  });

  @override
  State<StatefulWidget> createState() => SingleAssessmentWidgetState();
}

class SingleAssessmentWidgetState extends State<SingleAssessmentWidget>
    with Logger {
  BuildContext? buildContext;

  @override
  Widget build(BuildContext context) {
    buildContext = context;

    return DefaultContainer(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: Icon(
                Icons.medication_outlined,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
            ),
            Expanded(
              child: Text(
                "Assessment: ${widget.assessment.id} ${widget.assessment.intakeDate}",
                style: Theme.of(context).textTheme.headlineLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEditPressed,
            ),
          ],
        )
      ]),
    );
  }

  void onEditPressed() {
    logger.debug("Edit pressed for assessment: ${widget.assessment.id}");
    Navigator.push(
      buildContext!,
      MaterialPageRoute(
        builder: (context) {
          return AssessmentScreen(
            assessment: widget.assessment,
            assessmentsService: widget.assessmentsService,
          );
        },
      ),
    );
  }
}
