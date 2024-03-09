import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/update_meals_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/ingredients_in_ingredient_category.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/meal_time_list.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/save_button.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class UpdateMealsScreen extends StatefulWidget {
  final ValueChanged<Map<MealTime, Meal>> onMealsUpdated;
  final ValueGetter<Map<MealTime, Meal>> initMealsProvider;

  const UpdateMealsScreen(
      {super.key,
      required this.onMealsUpdated,
      required this.initMealsProvider});

  @override
  State<StatefulWidget> createState() => _UpdateMealsScreenState();
}

class _UpdateMealsScreenState extends State<UpdateMealsScreen> {
  late final UpdateMealsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = UpdateMealsController(
        _onIngredientCategoriesChanged, widget.initMealsProvider());
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
                  return IngredientsInIngredientCategory(
                      category: _controller.mainCategories[index],
                      onIngredientAdded: _controller.onIngredientAdded,
                      onIngredientRemoved: _controller.onIngredientRemoved,
                      selectedIngredientsIds:
                          getSelectedIngredientsIdsForCategory(
                              _controller.mainCategories[index]));
                },
              ),
              const SizedBox(height: 20),
              CustomSaveButton(
                  onSaveButtonClicked: () =>
                      widget.onMealsUpdated(_controller.meals))
            ],
          ),
        )));
  }

  void _onMealTimeChanged(MealTime mealTime) {
    _controller.onMealTimeChanged(mealTime);
    setState(() {});
  }

  void _onIngredientCategoriesChanged() {
    setState(() {});
  }

  List<String> getSelectedIngredientsIdsForCategory(
      IngredientCategory category) {
    return _controller
        .getSelectedIngredientsForCategory(category.id)
        .map((e) => e.id)
        .toList(growable: true);
  }
}
