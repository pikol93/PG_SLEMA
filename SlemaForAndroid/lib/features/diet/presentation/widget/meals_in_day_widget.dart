import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/diet/presentation/widget/meals_in_meal_time_widget.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class MealsInDayWidget extends StatelessWidget {
  final LinkedHashMap<MealTime, List<Meal>> meals;

  const MealsInDayWidget({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return MealsInMealTimeWidget(
                          mealTime: meals.entries.elementAt(index).key,
                          meals: meals.entries.elementAt(index).value)
                      .build(context);
                },
                childCount: meals.entries.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
