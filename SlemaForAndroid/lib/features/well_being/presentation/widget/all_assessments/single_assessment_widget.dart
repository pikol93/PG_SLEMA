import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/presentation/screen/assessment_screen.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class SingleAssessmentWidget extends StatefulWidget {
  final Assessment assessment;

  const SingleAssessmentWidget({
    super.key,
    required this.assessment,
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
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: onEditPressed,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Text("ID: ${widget.assessment.id}"),
              const SizedBox(height: 8.0),
              Text("Data: ${widget.assessment.intakeDate}"),
              const SizedBox(height: 8.0),
              Text("wellBeing: ${widget.assessment.wellBeing}"),
              const SizedBox(height: 8.0),
              Text("Symptomy: ${widget.assessment.symptomEntries}"),
              const SizedBox(height: 8.0),
              Text("Długość snu: ${widget.assessment.sleepDuration}"),
              const SizedBox(height: 8.0),
              Text("Jakość snu: ${widget.assessment.sleepQuality}"),
            ],
          ),
        ],
      ),
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
          );
        },
      ),
    );
  }
}
