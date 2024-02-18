import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/select_dishes_screen.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class SelectDishesButton extends StatelessWidget {
  final ValueChanged<Map<MealTime, List<Dish>>> onDishesSelected;

  const SelectDishesButton({super.key, required this.onDishesSelected});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SelectDishesScreen(onDishesSelected: onDishesSelected)));
      },
      child: const Icon(Icons.add),
    );
  }
}
