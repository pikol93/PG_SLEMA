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
      child: const Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          HomeAppBar(),
          SizedBox(
            height: 20.0,
          ),
          LabeledDivider(label: "Dzienny raport zdrowotny"),
          SizedBox(
            height: 20.0,
          ),
          LabeledDivider(label: "Nadchodzące wydarzenia"),
          SizedBox(
            height: 20.0,
          ),
          LabeledDivider(label: "Dla ciebie"),
          SizedBox(
            height: 20.0,
          ),
          HomeWidgetCustomContainer(child: MotivationDaily()),
        ],
      ),
    );
  }
}
