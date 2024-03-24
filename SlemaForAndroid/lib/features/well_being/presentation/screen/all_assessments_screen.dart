import 'dart:core';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/widget/all_assessments/single_assessment_widget.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class AllAssessmentsScreen extends StatefulWidget {
  final AssessmentsService service;

  const AllAssessmentsScreen({super.key, required this.service});

  @override
  State<AllAssessmentsScreen> createState() => _AllAssessmentsScreenState();
}

class _AllAssessmentsScreenState extends State<AllAssessmentsScreen>
    with Logger {
  late Future<List<Assessment>> assessmentsFuture;

  int counter = 1;

  @override
  void initState() {
    super.initState();

    assessmentsFuture = widget.service.getAll();
  }

  @override
  Widget build(BuildContext context) {
    logger.debug("building...");
    return Column(
      children: [
        const DefaultAppBar(title: "Raporty zdrowotne"),
        DefaultBody(
          child: FutureBuilder(
            future: assessmentsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<Assessment> displayedAssessments = snapshot.data!;
                return ListView.builder(
                  itemCount: displayedAssessments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleAssessmentWidget(
                            assessment: displayedAssessments[index])
                        .build(context);
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
        FloatingActionButton(onPressed: _onAddButtonPressed),
      ],
    );
  }

  void _onAddButtonPressed() {
    final assessment = Assessment(id: counter, intakeDate: DateTime.now());
    counter += 1;
    widget.service.saveEntry(assessment);
  }
}
