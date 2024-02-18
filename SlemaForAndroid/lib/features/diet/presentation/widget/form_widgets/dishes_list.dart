import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';

class DishesList extends StatefulWidget {
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

  @override
  State<StatefulWidget> createState() => _DishesListState();

  List<Text> dishesToWidgets() {
    return dishes.map((e) => Text(e.name)).toList();
  }
}

class _DishesListState extends State<DishesList> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        isSelected: widget.dishesToggles,
        onPressed: onTogglePressed,
        children: widget.dishesToWidgets());
  }

  void onTogglePressed(int index) {
    if (widget.dishesToggles[index] == true) {
      widget.onDishRemoved(widget.dishes[index].id);
    } else {
      widget.onDishAdded(widget.dishes[index]);
    }
  }
}
