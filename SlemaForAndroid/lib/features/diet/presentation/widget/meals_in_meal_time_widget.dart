import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/container_with_divider.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';
import 'package:pg_slema/features/diet/presentation/widget/form_widgets/ingredients_list.dart';
import 'package:pg_slema/features/diet/presentation/screen/update_meals_screen.dart';

class MealInMealTimeWidget extends StatelessWidget {
  final MealTime mealTime;
  final Meal? meal;
  final ValueChanged<Map<MealTime, Meal>> onMealsSelected;
  final ValueGetter<Map<MealTime, Meal>> initMealsProvider;

  const MealInMealTimeWidget(
      {super.key,
      required this.mealTime,
      required this.meal,
      required this.onMealsSelected,
      required this.initMealsProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerWithDivider(
          label: mealTime.name,
          iconDataRight: Icons.edit,
          onIconRightPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateMealsScreen(
                  onMealsUpdated: onMealsSelected,
                  initMealsProvider: initMealsProvider,
                  mealTime: mealTime,
                ),
              ),
            );
          },
          child: meal != null
              ? IngredientsList(
                  ingredients: meal!.ingredients,
                  onIngredientAdded: null,
                  onIngredientRemoved: null,
                  ingredientsToggles: null,
                  isExpanded: true,
                  expandContainer: () {},
                )
              : null,
        ),
      ],
    );
  }
}
