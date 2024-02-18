import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/select_dishes_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/dishes_in_dish_category.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/meal_time_list.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/save_button.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish_category/logic/entity/dish_category.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class SelectDishesScreen extends StatefulWidget {
  final ValueChanged<Map<MealTime, List<Dish>>> onDishesSelected;
  final ValueGetter<Map<MealTime, List<Dish>>> initDishesProvider;

  const SelectDishesScreen(
      {super.key,
      required this.onDishesSelected,
      required this.initDishesProvider});

  @override
  State<StatefulWidget> createState() => _SelectDishesScreenState();
}

class _SelectDishesScreenState extends State<SelectDishesScreen> {
  late final SelectDishesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SelectDishesController(
        _onDishCategoriesChanged, widget.initDishesProvider());
    _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edytuj posiłki"),
          centerTitle: true,
        ),
        body: Center(
            child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MealTimeList(
                  onMealTimeChanged: _onMealTimeChanged,
                  initialValue: _controller.currentMealTime),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _controller.mainCategories.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return DishesInDishCategory(
                      category: _controller.mainCategories[index],
                      onDishAdded: _controller.onDishAdded,
                      onDishRemoved: _controller.onDishRemoved,
                      selectedDishesIds: getSelectedDishesIdsForCategory(
                          _controller.mainCategories[index]));
                },
              ),
              const SizedBox(height: 20),
              CustomSaveButton(
                  onSaveButtonClicked: () =>
                      widget.onDishesSelected(_controller.selectedDishes))
            ],
          ),
        )));
  }

  void _onMealTimeChanged(MealTime mealTime) {
    _controller.onMealTimeChanged(mealTime);
    setState(() {});
  }

  void _onDishCategoriesChanged() {
    setState(() {});
  }

  List<String> getSelectedDishesIdsForCategory(DishCategory category) {
    return _controller
        .getSelectedDishesForCategory(category.id)
        .map((e) => e.id)
        .toList(growable: true);
  }
}
