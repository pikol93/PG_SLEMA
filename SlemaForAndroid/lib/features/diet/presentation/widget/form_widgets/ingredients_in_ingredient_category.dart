import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/ingredients_list.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';
import 'package:pg_slema/utils/widgets/default_container/container_divider.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

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
    return DefaultContainer(
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.egg_alt,
                  size: 30.0), //TODO Icon connected to the category
              const SizedBox(width: 5.0),
              Text(
                widget.category.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(height: 0.59),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: expandContainer,
                    color: Theme.of(context).dividerColor.withOpacity(0.4),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    padding: EdgeInsets.zero,
                    iconSize: 30,
                    constraints: const BoxConstraints(),
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
              )
            ],
          ),
          const ContainerDivider(),
          IngredientsList(
            ingredients: widget.getIngredients(),
            onIngredientAdded: _onIngredientAdded,
            onIngredientRemoved: _onIngredientRemoved,
            ingredientsToggles: widget.ingredientsToToggles(),
            isExpanded: ingredientsExpanded,
          )
        ],
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
