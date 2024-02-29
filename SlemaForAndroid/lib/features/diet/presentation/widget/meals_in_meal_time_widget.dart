import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class MealInMealTimeWidget extends StatelessWidget {
  final MealTime mealTime;
  final Meal? meal;

  const MealInMealTimeWidget(
      {super.key, required this.mealTime, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mealTime.name,
        ),
        Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Text(meal?.ingredients.elementAt(index).name ?? "")
                          .build(context);
                    },
                    childCount: meal?.ingredients.length ?? 0,
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
