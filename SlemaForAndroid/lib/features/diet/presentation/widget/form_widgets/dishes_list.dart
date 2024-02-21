import 'package:flutter/material.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';

class DishesList extends StatelessWidget {
  final List<Dish> dishes;
  final ValueChanged<Dish> onDishAdded;
  final ValueChanged<String> onDishRemoved;
  final List<bool> dishesToggles;

  const DishesList(
      {super.key,
      required this.dishes,
      required this.onDishAdded,
      required this.onDishRemoved,
      required this.dishesToggles});

  List<Text> dishesToWidgets() {
    return dishes.map((e) => Text(e.name)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        isSelected: dishesToggles,
        onPressed: onTogglePressed,
        children: dishesToWidgets());
  }

  void onTogglePressed(int index) {
    if (dishesToggles[index] == true) {
      onDishRemoved(dishes[index].id);
    } else {
      onDishAdded(dishes[index]);
    }
  }
}
