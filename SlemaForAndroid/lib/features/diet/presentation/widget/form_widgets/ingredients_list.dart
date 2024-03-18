import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/ingredient_toggle_button.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';

class IngredientsList extends StatefulWidget {
  final List<Ingredient> ingredients;
  final ValueChanged<Ingredient>? onIngredientAdded;
  final ValueChanged<String>? onIngredientRemoved;
  final List<bool>? ingredientsToggles;
  final bool isExpanded;
  final int ingredientsCollapsedNumber = 5;
  final VoidCallback? expandContainer;

  const IngredientsList(
      {super.key,
      required this.ingredients,
      this.onIngredientAdded,
      this.onIngredientRemoved,
      this.ingredientsToggles,
      required this.isExpanded,
      this.expandContainer});

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
              isToggledOn: widget.ingredientsToggles?[index] ?? false,
            )))
        .values
        .toList();
  }

  List<Widget> getWrapChildren() {
    List<Widget> children = ingredientsToWidgets();
    if (!widget.isExpanded) {
      List<Widget> newChildren = children.sublist(
          0, min(children.length, widget.ingredientsCollapsedNumber));

      int optionsLeft = children.length - newChildren.length;
      newChildren.add(IngredientToggleButton(
        label: "+$optionsLeft więcej",
        onTogglePressed: widget.expandContainer ?? () {},
        isToggledOn: false,
      ));
      children = newChildren;
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: getWrapChildren(),
      ),
    );
  }

  void onTogglePressed(int index) {
    if (widget.ingredientsToggles == null) return; //if onPress not used

    if (widget.ingredientsToggles![index] == true) {
      widget.onIngredientRemoved!(widget.ingredients[index].id);
    } else {
      widget.onIngredientAdded!(widget.ingredients[index]);
    }
    setState(() {
      widget.ingredientsToggles![index] = !widget.ingredientsToggles![index];
    });
  }
}
