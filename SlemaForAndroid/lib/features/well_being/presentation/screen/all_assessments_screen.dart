import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/repository/shared_preferences_assessments_repository.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service_impl.dart';
import 'package:pg_slema/features/well_being/presentation/widget/all_assessments/single_assessment_widget.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class AllAssessmentsScreen extends StatefulWidget {
  const AllAssessmentsScreen({super.key});

  @override
  State<AllAssessmentsScreen> createState() => _AllAssessmentsScreenState();
}

class _AllAssessmentsScreenState extends State<AllAssessmentsScreen> {
  late final AssessmentsService _service;

  @override
  void initState() {
    super.initState();

    // TODO: Optimally, these should be injected.
    var repository = SharedPreferencesAssessmentsRepository();
    _service = AssessmentsServiceImpl(repository: repository);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Raporty zdrowotne"),
        DefaultBody(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return const SingleAssessmentWidget().build(context);
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
