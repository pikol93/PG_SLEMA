import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/screen/select_dishes_screen.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class SelectDishesButton extends StatelessWidget {
  final ValueChanged<Map<MealTime, List<Ingredient>>> onMealsSelected;
  final ValueGetter<Map<MealTime, List<Ingredient>>> initMealsProvider;

  const SelectDishesButton(
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
                builder: (context) => SelectDishesScreen(
                    onDishesSelected: onMealsSelected,
                    initDishesProvider: initMealsProvider)));
      },
      child: const Icon(Icons.add),
    );
  }
}
