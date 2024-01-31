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
    return Container(
      color: const Color(0xFFE7ECEF), //TODO
      child: Column(
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
            "---------Raport zdrowotny---------",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  height: 1.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF133150), //TODO
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
            "---------Raport zdrowotny---------",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  height: 1.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF133150), //TODO
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
      ),
    );
  }
}
