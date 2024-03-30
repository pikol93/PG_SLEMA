import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/container_with_divider.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/ingredients_list.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';

class IngredientsInIngredientCategory extends StatefulWidget {
  final IngredientCategory category;
  final ValueChanged<Ingredient> onIngredientAdded;
  final ValueChanged<String> onIngredientRemoved;
  final List<String> selectedIngredientsIds;

  const IngredientsInIngredientCategory(
      {super.key,
      required this.category,
      required this.onIngredientAdded,
      required this.onIngredientRemoved,
      required this.selectedIngredientsIds});

  @override
  State<StatefulWidget> createState() =>
      _IngredientsInIngredientCategoryState();

  List<bool> ingredientsToToggles() {
    return category.ingredients
            ?.map((e) => selectedIngredientsIds.contains(e.id))
            .toList() ??
        List.empty();
  }

  List<Ingredient> getIngredients() {
    return category.ingredients ?? List.empty();
  }
}

class _IngredientsInIngredientCategoryState
    extends State<IngredientsInIngredientCategory> {
  bool ingredientsExpanded = false;
  void expandContainer() {
    setState(() {
      ingredientsExpanded = !ingredientsExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWithDivider(
      iconDataLeft: Icons.egg_alt, //TODO Icon connected to the category
      label: widget.category.name,
      onIconRightPressed: expandContainer,
      iconDataRight: Icons.keyboard_arrow_down_rounded,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        child: IngredientsList(
          ingredients: widget.getIngredients(),
          onIngredientAdded: _onIngredientAdded,
          onIngredientRemoved: _onIngredientRemoved,
          ingredientsToggles: widget.ingredientsToToggles(),
          isExpanded: ingredientsExpanded,
          expandContainer: expandContainer,
        ),
      ),
    );
  }

  void _onIngredientAdded(Ingredient value) {
    widget.onIngredientAdded(value);
    setState(() {
      widget.selectedIngredientsIds.add(value.id);
    });
  }

  void _onIngredientRemoved(String value) {
    widget.onIngredientRemoved(value);
    setState(() {
      widget.selectedIngredientsIds.removeWhere((element) => element == value);
    });
  }
}
