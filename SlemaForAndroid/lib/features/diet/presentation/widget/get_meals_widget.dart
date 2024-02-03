import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/diet/presentation/controller/diet_screen_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/get_meals_in_meal_time_widget.dart';

class GetMealsWidget extends StatefulWidget {
  final Stream<DateTime> stream;

  const GetMealsWidget({super.key, required this.stream});

  @override
  State<StatefulWidget> createState() => _GetMealsWidgetState();
}

class _GetMealsWidgetState extends State<GetMealsWidget> {
  late DietScreenController controller;

  @override
  void initState() {
    super.initState();
    controller = DietScreenController(_onMealsChanged);
    widget.stream.listen((date) {
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
                  return GetMealsInMealTimeWidget(
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
  }
}
