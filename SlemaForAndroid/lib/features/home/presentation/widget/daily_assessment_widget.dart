import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/screen/assessment_screen.dart';
import 'package:pg_slema/utils/date/date.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class DailyAssessmentWidget extends StatefulWidget {
  final AssessmentFactory factory;
  final AssessmentsService service;

  const DailyAssessmentWidget({
    super.key,
    required this.factory,
    required this.service,
  });

  @override
  State<StatefulWidget> createState() => DailyAssessmentWidgetState();
}

class DailyAssessmentWidgetState extends State<DailyAssessmentWidget>
    with Logger {
  late Future<Assessment?> mostRecentAssessmentFuture;

  @override
  void initState() {
    super.initState();

    mostRecentAssessmentFuture = widget.service.getMostRecentAssessment();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      shadow: false,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
                future: mostRecentAssessmentFuture, builder: _futureBuilder),
          ),
        ],
      ),
    );
  }

  Widget _futureBuilder(
    BuildContext context,
    AsyncSnapshot<Assessment?> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildWaiting();
    }

    Assessment? displayedAssessments = snapshot.data;
    if (displayedAssessments == null ||
        !displayedAssessments.intakeDate.isToday) {
      return _buildAssessmentNotDone(context);
    }

    return _buildAssessmentDone(context);
  }

  Widget _buildWaiting() {
    return const SizedBox(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildAssessmentNotDone(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        "Dotknij, aby wypełnić dzisiejszy raport zdrowotny",
        softWrap: true,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }

  Widget _buildAssessmentDone(
    BuildContext context,
  ) {
    return Text(
      "Raport został już dzisiaj wypełniony",
      softWrap: true,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }

  void onPressed() {
    widget.factory.generateWithUniqueId().then(
          (assessment) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AssessmentScreen(
                assessment: assessment,
                isModification: false,
              ),
            ),
          ),
        );
  }
}
