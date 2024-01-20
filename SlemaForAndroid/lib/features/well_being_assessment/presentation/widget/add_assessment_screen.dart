import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/add_assessment_app_bar.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/sleep/assessment_sleep_form.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/common/assessment_entry.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/symptoms/assessment_symptoms_form.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/well_being/assessment_well_being_form.dart';
import 'package:pg_slema/utils/date/date.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AddAssessmentScreen extends StatefulWidget {
  const AddAssessmentScreen({super.key});

  @override
  State<AddAssessmentScreen> createState() => _AddAssessmentScreenState();
}

class _AddAssessmentScreenState extends State<AddAssessmentScreen> with Logger {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final currentDateString = DateTime.now().toDateString();
    return Scaffold(
      appBar: AddAssessmentAppBar(currentDateString),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: const Column(
            children: [
              AssessmentFormContainer(
                child: AssessmentWellBeingForm(),
              ),
              AssessmentFormContainer(
                child: AssessmentSymptomsFormWidget(),
              ),
              AssessmentFormContainer(
                child: AssessmentSleepForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
