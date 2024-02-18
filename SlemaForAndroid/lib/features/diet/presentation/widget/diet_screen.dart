import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/diet_app_bar.dart';
import 'package:pg_slema/features/diet/presentation/widget/meals_in_day_widget.dart';
import 'package:pg_slema/features/diet/presentation/widget/select_dishes_button.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late StreamController<DateTime> _dateController;
  late LinkedHashMap<MealTime, List<Meal>> _meals;

  @override
  void initState() {
    super.initState();
    _dateController = StreamController();
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
      body: MealsInDayWidget(
          dateStream: _dateController.stream,
          onMealsChanged: (value) => (_meals = value)),
      floatingActionButton: SelectDishesButton(
        onDishesSelected: (dishes) {},
        initDishesProvider: _mealsToDishes,
      ), //TODO
    );
  }

  void _onDateChanged(DateTime date) async {
    _dateController.add(date);
  }

  Map<MealTime, List<Dish>> _mealsToDishes() {
    return _meals.map((key, value) {
      var dishes = value.map((e) => e.dish).toList(growable: true);
      return MapEntry(key, dishes);
    });
  }
}
