import 'dart:core';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/widget/all_assessments/single_assessment_widget.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class AllAssessmentsScreen extends StatefulWidget {
  final AssessmentsService service;
  final AssessmentFactory factory;

  const AllAssessmentsScreen({
    super.key,
    required this.service,
    required this.factory,
  });

  @override
  State<AllAssessmentsScreen> createState() => _AllAssessmentsScreenState();
}

class _AllAssessmentsScreenState extends State<AllAssessmentsScreen>
    with Logger {
  late Future<List<Assessment>> assessmentsFuture;

  @override
  void initState() {
    super.initState();
    widget.service
        .getAssessmentChangeNotifier()
        .addListener(_onAssessmentsChanged);

    // Simulate data changing, to have the data correctly appear on the screen.
    _onAssessmentsChanged();
  }

  @override
  void dispose() {
    super.dispose();
    widget.service
        .getAssessmentChangeNotifier()
        .removeListener(_onAssessmentsChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        const WhiteAppBar(titleText: "Raporty"),
        DefaultBody(
          child: FutureBuilder(
            future: assessmentsFuture,
            builder: _futureBuilder,
          ),
        ),
      ],
    );
  }

  Widget _futureBuilder(
    BuildContext context,
    AsyncSnapshot<List<Assessment>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
        ),
      );
    }

    List<Assessment> displayedAssessments = snapshot.data!;
    return ListView.builder(
      itemCount: displayedAssessments.length,
      itemBuilder: (BuildContext context, int index) {
        return SingleAssessmentWidget(
          assessment: displayedAssessments[index],
        );
      },
    );
  }

  void _onAssessmentsChanged() {
    logger.debug("On assessments changed.");
    setState(() {
      assessmentsFuture = widget.service.getAll();
    });
  }
}
