import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/diet_app_bar.dart';
import 'package:pg_slema/features/diet/presentation/widget/get_meals_widget.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late StreamController<DateTime> controller;

  @override
  void initState() {
    super.initState();
    controller = StreamController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DietAppBar(
          onDateChanged: _onDateChanged,
        ),
      ),
      body: GetMealsWidget(stream: controller.stream),
    );
  }

  void _onDateChanged(DateTime date) async {
    controller.add(date);
  }
}
