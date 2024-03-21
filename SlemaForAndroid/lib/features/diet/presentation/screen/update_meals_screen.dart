import 'package:flutter/material.dart';
import 'package:pg_slema/custom_icons_icons.dart';
import 'package:pg_slema/features/diet/presentation/controller/update_meals_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/ingredients_in_ingredient_category.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/meal_time_info.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/forms/save_button.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';

class UpdateMealsScreen extends StatefulWidget {
  final ValueChanged<Map<MealTime, Meal>> onMealsUpdated;
  final ValueGetter<Map<MealTime, Meal>> initMealsProvider;
  final MealTime mealTime;

  const UpdateMealsScreen(
      {super.key,
      required this.onMealsUpdated,
      required this.initMealsProvider,
      required this.mealTime});

  @override
  State<StatefulWidget> createState() => _UpdateMealsScreenState();
}

class _UpdateMealsScreenState extends State<UpdateMealsScreen> {
  late final UpdateMealsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = UpdateMealsController(
      _onIngredientCategoriesChanged,
      widget.initMealsProvider(),
      widget.mealTime,
    );
    _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Zarządzaj posiłkami"),
        DefaultBody(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                MealTimeInfo(
                  iconData: CustomIcons.meal_type,
                  mealTimeName: _controller.currentMealTime.name,
                ),
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
                CustomSaveButton(
                  onSaved: () => widget.onMealsUpdated(_controller.meals),
                  formKey: null,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
      ],
    );
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
