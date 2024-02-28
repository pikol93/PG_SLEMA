import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/screen/select_dishes_screen.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class SelectDishesButton extends StatelessWidget {
  final ValueChanged<Map<MealTime, List<Ingredient>>> onDishesSelected;
  final ValueGetter<Map<MealTime, List<Ingredient>>> initDishesProvider;

  const SelectDishesButton(
      {super.key,
      required this.onDishesSelected,
      required this.initDishesProvider});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectDishesScreen(
                    onDishesSelected: onDishesSelected,
                    initDishesProvider: initDishesProvider)));
      },
      child: const Icon(Icons.add),
    );
  }
}
