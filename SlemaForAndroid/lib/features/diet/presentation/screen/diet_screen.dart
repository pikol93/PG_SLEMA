import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/diet_screen_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/diet_app_bar.dart';
import 'package:pg_slema/features/diet/presentation/widget/meals_in_day_widget.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late DietScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DietScreenController(_onMealsChanged);
    _controller.initializeMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DietAppBar(onDateChanged: _onDateChanged, initDate: _controller.date),
        DefaultBody(
          child: MealsInDayWidget(
            meals: _controller.meals,
            onMealsSelected: _onMealsSelected,
            initMealsProvider: _mealsProvider,
          ),
        ),
      ],
    );
  }

  void _onDateChanged(DateTime date) async {
    _controller.onDateChanged(date);
    setState(() {});
  }

  void _onMealsSelected(Map<MealTime, Meal> meals) async {
    _controller.updateMeals(meals);
  }

  void _onMealsChanged() {
    setState(() {});
  }

  Map<MealTime, Meal> _mealsProvider() {
    return _controller.meals.map((key, value) {
      var newValue = value ?? Meal("", "", [], _controller.date, key);
      return MapEntry(key, newValue);
    });
  }
}
