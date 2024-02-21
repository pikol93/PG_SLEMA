import 'package:flutter/material.dart';
import 'package:pg_slema/features/home/presentation/widget/home_app_bar.dart';
import 'package:pg_slema/features/home/presentation/widget/home_widget_custom_container.dart';
import 'package:pg_slema/features/home/presentation/widget/labeled_divider.dart';
import 'package:pg_slema/features/motivation/presentation/widget/motivation_daily.dart';

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
        const SizedBox(
          height: 20.0,
        ),
        const HomeAppBar(),
        const SizedBox(
          height: 20.0,
        ),
        const LabeledDivider(label: "Dzienny raport zdrowotny"),
        const SizedBox(
          height: 20.0,
        ),
        HomeWidgetCustomContainer(
            child: Text(
          "Raport zdrowotny",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        )),
        const SizedBox(
          height: 20.0,
        ),
        const LabeledDivider(label: "Nadchodzące wydarzenia"),
        const SizedBox(
          height: 20.0,
        ),
        HomeWidgetCustomContainer(
            child: Text(
          "Kalendarz",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        )),
        const SizedBox(
          height: 20.0,
        ),
        const LabeledDivider(label: "Dla ciebie"),
        const SizedBox(
          height: 20.0,
        ),
        const HomeWidgetCustomContainer(child: MotivationDaily()),
      ],
    );
  }
}
