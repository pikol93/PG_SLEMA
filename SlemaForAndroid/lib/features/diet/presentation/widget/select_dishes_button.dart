import 'package:flutter/material.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class SelectDishesButton extends StatelessWidget {
  final ValueSetter<Map<MealTime, List<Dish>>> onDishesSelected;

  const SelectDishesButton({super.key, required this.onDishesSelected});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => //TODO: selectDishesScreen
            ));
      },
      child: const Icon(Icons.add),
    );
  }
}
