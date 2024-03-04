import 'package:flutter/material.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';

class IngredientsList extends StatelessWidget {
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

  List<Text> ingredientsToWidgets() {
    return ingredients.map((e) => Text(e.name)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
        isSelected: ingredientsToggles,
        onPressed: onTogglePressed,
        children: ingredientsToWidgets());
  }

  void onTogglePressed(int index) {
    if (ingredientsToggles[index] == true) {
      onIngredientRemoved(ingredients[index].id);
    } else {
      onIngredientAdded(ingredients[index]);
    }
  }
}
