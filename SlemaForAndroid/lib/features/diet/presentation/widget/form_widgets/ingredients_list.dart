import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/ingredient_toggle_button.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';

class IngredientsList extends StatefulWidget {
  final List<Ingredient> ingredients;
  final ValueChanged<Ingredient> onIngredientAdded;
  final ValueChanged<String> onIngredientRemoved;
  final List<bool> ingredientsToggles;

  const IngredientsList(
      {super.key,
      required this.ingredients,
      required this.onIngredientAdded,
      required this.onIngredientRemoved,
      required this.ingredientsToggles});

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  List<IngredientToggleButton> ingredientsToWidgets() {
    return widget.ingredients
        .asMap()
        .map((index, e) => MapEntry(
            index,
            IngredientToggleButton(
              label: e.name,
              onTogglePressed: () => onTogglePressed(index),
              isToggledOn: widget.ingredientsToggles[index],
            )))
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: ingredientsToWidgets(),
      ),
    );
  }

  void onTogglePressed(int index) {
    if (widget.ingredientsToggles[index] == true) {
      widget.onIngredientRemoved(widget.ingredients[index].id);
    } else {
      widget.onIngredientAdded(widget.ingredients[index]);
    }
    setState(() {
      widget.ingredientsToggles[index] = !widget.ingredientsToggles[index];
    });
  }
}
