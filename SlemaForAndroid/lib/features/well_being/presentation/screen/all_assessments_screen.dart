import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/widget/all_assessments/single_assessment_widget.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class AllAssessmentsScreen extends StatefulWidget {
  final AssessmentsService service;

  const AllAssessmentsScreen({super.key, required this.service});

  @override
  State<AllAssessmentsScreen> createState() => _AllAssessmentsScreenState();
}

class _AllAssessmentsScreenState extends State<AllAssessmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Raporty zdrowotne"),
        DefaultBody(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              var assessment = Assessment(
                id: index,
                intakeDate: DateTime.timestamp(),
              );
              return SingleAssessmentWidget(assessment: assessment)
                  .build(context);
            },
          ),
        )
      ],
    );
  }

  void _onMedicinesChanged() {
    setState(() {});
  }
}
