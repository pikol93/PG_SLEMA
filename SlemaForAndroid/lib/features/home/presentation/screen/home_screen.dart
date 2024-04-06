import 'package:flutter/material.dart';
import 'package:pg_slema/features/home/presentation/widget/daily_assessment_widget.dart';
import 'package:pg_slema/features/home/presentation/widget/home_app_bar.dart';
import 'package:pg_slema/features/home/presentation/widget/labeled_divider.dart';
import 'package:pg_slema/features/motivation/presentation/widget/motivation_daily.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class HomeScreen extends StatefulWidget {
  final AssessmentFactory assessmentFactory;
  final AssessmentsService assessmentService;

  const HomeScreen({
    super.key,
    required this.assessmentFactory,
    required this.assessmentService,
  });

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        const HomeAppBar(),
        const SizedBox(
          height: 20.0,
        ),
        const LabeledDivider(label: "Dzienny raport zdrowotny"),
        const SizedBox(
          height: 5.0,
        ),
        DailyAssessmentWidget(
          factory: widget.assessmentFactory,
          service: widget.assessmentService,
        ),
        const SizedBox(
          height: 5.0,
        ),
        const LabeledDivider(label: "Nadchodzące wydarzenia"),
        const SizedBox(
          height: 5.0,
        ),
        DefaultContainer(
            shadow: false,
            padding: const EdgeInsets.all(15),
            child: Text(
              "Kalendarz",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            )),
        const SizedBox(
          height: 5.0,
        ),
        const LabeledDivider(label: "Dla ciebie"),
        const SizedBox(
          height: 5.0,
        ),
        const DefaultContainer(
            shadow: false,
            padding: EdgeInsets.all(15),
            child: MotivationDaily()),
      ],
    );
  }
}
