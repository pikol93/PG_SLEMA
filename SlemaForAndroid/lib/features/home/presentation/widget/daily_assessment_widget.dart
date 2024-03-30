import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/utils/date/date.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class DailyAssessmentWidget extends StatefulWidget {
  final AssessmentsService assessmentsService;

  const DailyAssessmentWidget({
    super.key,
    required this.assessmentsService,
  });

  @override
  State<StatefulWidget> createState() => DailyAssessmentWidgetState();
}

class DailyAssessmentWidgetState extends State<DailyAssessmentWidget> {
  late Future<Assessment?> mostRecentAssessmentFuture;

  @override
  void initState() {
    super.initState();

    mostRecentAssessmentFuture =
        widget.assessmentsService.getMostRecentAssessment();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      shadow: false,
      padding: const EdgeInsets.all(15),
      child: FutureBuilder(
          future: mostRecentAssessmentFuture, builder: _futureBuilder),
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
      return _buildAssessmentNotDone();
    }

    return _buildAssessmentDone();
  }

  Widget _buildWaiting() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }

  Widget _buildAssessmentNotDone() {
    return const Text("not done");
  }

  Widget _buildAssessmentDone() {
    return const Text("done");
  }
}
