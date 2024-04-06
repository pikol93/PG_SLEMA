import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/dividers/labeled_section_divider.dart';
import 'package:pg_slema/features/motivation/presentation/widget/motivation_daily.dart';
import 'package:pg_slema/features/upcoming_events/presentation/widget/upcoming_events_widget.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WhiteAppBar(
          titleText: "Dzień dobry!",
        ),
        const LabeledSectionDivider(label: "Dzienny raport zdrowotny"),
        const SizedBox(
          height: 5.0,
        ),
        DefaultContainer(
          shadow: false,
          padding: const EdgeInsets.all(15),
          child: Text(
            "Raport zdrowotny",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        const LabeledSectionDivider(label: "Nadchodzące wydarzenia"),
        const SizedBox(
          height: 5.0,
        ),
        UpcomingEventsWidget(),
        const SizedBox(
          height: 5.0,
        ),
        const LabeledSectionDivider(label: "Dla ciebie"),
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
