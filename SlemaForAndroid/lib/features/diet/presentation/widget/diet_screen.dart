import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/diet_app_bar.dart';
import 'package:pg_slema/features/diet/presentation/widget/meals_in_day_widget.dart';
import 'package:pg_slema/features/diet/presentation/widget/select_dishes_button.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late StreamController<DateTime> _controller;

  @override
  void initState() {
    super.initState();
    _controller = StreamController();
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
      body: MealsInDayWidget(stream: _controller.stream),
      floatingActionButton:
          SelectDishesButton(onDishesSelected: (dishes) {}), //TODO
    );
  }

  void _onDateChanged(DateTime date) async {
    _controller.add(date);
  }
}
