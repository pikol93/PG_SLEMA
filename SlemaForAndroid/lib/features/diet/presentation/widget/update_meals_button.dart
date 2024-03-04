import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/screen/update_meals_screen.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class UpdateMealsButton extends StatelessWidget {
  final ValueChanged<Map<MealTime, Meal>> onMealsSelected;
  final ValueGetter<Map<MealTime, Meal>> initMealsProvider;

  const UpdateMealsButton(
      {super.key,
      required this.onMealsSelected,
      required this.initMealsProvider});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UpdateMealsScreen(
                    onMealsUpdated: onMealsSelected,
                    initMealsProvider: initMealsProvider)));
      },
      child: const Icon(Icons.add),
    );
  }
}
