import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/diet/presentation/widget/meals_in_meal_time_widget.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class MealsInDayWidget extends StatelessWidget {
  final LinkedHashMap<MealTime, Meal?> meals;
  final ValueChanged<Map<MealTime, Meal>> onMealsSelected;
  final ValueGetter<Map<MealTime, Meal>> initMealsProvider;

  const MealsInDayWidget(
      {super.key,
      required this.meals,
      required this.onMealsSelected,
      required this.initMealsProvider});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: meals.entries.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MealInMealTimeWidget(
            mealTime: meals.keys.elementAt(index),
            meal: meals.values.elementAt(index),
            onMealsSelected: onMealsSelected,
            initMealsProvider: initMealsProvider,
          ).build(context);
        },
      ),
    );
  }
}
