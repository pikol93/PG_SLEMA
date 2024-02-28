import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/dishes_list.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/dish_category/logic/entity/dish_category.dart';

class DishesInDishCategory extends StatefulWidget {
  final DishCategory category;
  final ValueChanged<Ingredient> onDishAdded;
  final ValueChanged<String> onDishRemoved;
  final List<String> selectedDishesIds;

  const DishesInDishCategory(
      {super.key,
      required this.category,
      required this.onDishAdded,
      required this.onDishRemoved,
      required this.selectedDishesIds});

  @override
  State<StatefulWidget> createState() => _DishesInDishCategoryState();

  List<bool> dishesToToggles() {
    return category.dishes
            ?.map((e) => selectedDishesIds.contains(e.id))
            .toList() ??
        List.empty();
  }

  List<Ingredient> getDishes() {
    return category.dishes ?? List.empty();
  }
}

class _DishesInDishCategoryState extends State<DishesInDishCategory> {
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
        DishesList(
            dishes: widget.getDishes(),
            onDishAdded: _onDishAdded,
            onDishRemoved: _onDishRemoved,
            dishesToggles: widget.dishesToToggles())
      ],
    );
  }

  void _onDishAdded(Ingredient value) {
    widget.onDishAdded(value);
    setState(() {
      widget.selectedDishesIds.add(value.id);
    });
  }

  void _onDishRemoved(String value) {
    widget.onDishRemoved(value);
    setState(() {
      widget.selectedDishesIds.removeWhere((element) => element == value);
    });
  }
}
