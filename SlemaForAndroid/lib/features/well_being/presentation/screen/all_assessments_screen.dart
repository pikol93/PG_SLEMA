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
  static const startingDisplayedCount = 10;
  static const displayedElementsAppendedAfterScrollingCount = 10;

  final ScrollController _scrollController = ScrollController();

  int counter = 0;
  bool builtBefore = false;
  List<Assessment> displayedAssessments = List.empty();

  @override
  void initState() {
    super.initState();

    widget.service
        .getTopEntries(startingDisplayedCount)
        .then(_onMedicinesChanged);

    _scrollController.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    logger.debug("building...");
    if (!builtBefore) {
      builtBefore = true;
    }

    return Column(
      children: [
        const DefaultAppBar(title: "Raporty zdrowotne"),
        DefaultBody(
          child: ListView.builder(
            itemCount: displayedAssessments.length,
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              return SingleAssessmentWidget(
                      assessment: displayedAssessments[index])
                  .build(context);
            },
          ),
        ),
        FloatingActionButton(onPressed: _onAddButtonPressed),
      ],
    );
  }

  void _onMedicinesChanged(List<Assessment> assessments) {
    logger.debug(
        "on medicines changed: assessments length = ${assessments.length}");
    displayedAssessments = assessments;
    setState(() {});
  }

  void _onAddButtonPressed() {
    final assessment = Assessment(id: counter, intakeDate: DateTime.now());
    counter += 1;
    widget.service.saveEntry(assessment);
  }

  void onScroll() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      logger.debug("reached bottom");
      counter += displayedElementsAppendedAfterScrollingCount;
      widget.service.getTopEntries(counter).then(_onMedicinesChanged);
    }
  }
}
