import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(widget.category.name),
        const SizedBox(
          height: 10,
        ),
        IngredientsList(
            ingredients: widget.getIngredients(),
            onIngredientAdded: _onIngredientAdded,
            onIngredientRemoved: _onIngredientRemoved,
            ingredientsToggles: widget.ingredientsToToggles())
      ],
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
