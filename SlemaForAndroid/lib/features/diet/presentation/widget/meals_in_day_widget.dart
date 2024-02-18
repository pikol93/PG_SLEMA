import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/diet/presentation/controller/meals_in_day_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/meals_in_meal_time_widget.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class MealsInDayWidget extends StatefulWidget {
  final Stream<DateTime> dateStream;
  final ValueChanged<LinkedHashMap<MealTime, List<Meal>>> onMealsChanged;

  const MealsInDayWidget(
      {super.key, required this.dateStream, required this.onMealsChanged});

  @override
  State<StatefulWidget> createState() => _MealsInDayWidgetState();
}

class _MealsInDayWidgetState extends State<MealsInDayWidget> {
  late MealsInDayController controller;

  @override
  void initState() {
    super.initState();
    controller = MealsInDayController(_onMealsChanged);
    controller.initializeMeals();
    widget.dateStream.listen((date) {
      controller.onDateChanged(date);
    });
  }

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
                          mealTime:
                              controller.meals.entries.elementAt(index).key,
                          meals:
                              controller.meals.entries.elementAt(index).value)
                      .build(context);
                },
                childCount: controller.meals.entries.length,
              ),
            ),
          ],
        );
      },
    );
  }

  void _onMealsChanged() {
    setState(() {});
    widget.onMealsChanged(controller.meals);
  }
}
