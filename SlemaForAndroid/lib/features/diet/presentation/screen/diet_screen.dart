import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/diet_screen_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/diet_app_bar.dart';
import 'package:pg_slema/features/diet/presentation/widget/meals_in_day_widget.dart';
import 'package:pg_slema/features/diet/presentation/widget/select_dishes_button.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DietAppBar(
          onDateChanged: _onDateChanged,
          initDate: _controller.date,
        ),
      ),
      body: MealsInDayWidget(meals: _controller.meals),
      floatingActionButton: SelectDishesButton(
        onDishesSelected: _onDishesSelected,
        initDishesProvider: _mealsToDishes,
      ),
    );
  }

  void _onDateChanged(DateTime date) async {
    _controller.onDateChanged(date);
    setState(() {});
  }

  void _onDishesSelected(Map<MealTime, List<Ingredient>> dishes) async {
    _controller.updateMeals(dishes);
  }

  void _onMealsChanged() {
    setState(() {});
  }

  Map<MealTime, List<Ingredient>> _mealsToDishes() {
    return _controller.meals.map((key, value) {
      var dishes = value.map((e) => e.ingredients).toList(growable: true);
      return MapEntry(key, dishes);
    });
  }
}
