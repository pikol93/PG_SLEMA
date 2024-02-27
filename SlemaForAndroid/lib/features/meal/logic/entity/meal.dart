import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class Meal {
  static const String mealListSharedPrefKey = 'meals';
  final String id;
  final Set<Dish> dishes;
  final DateTime mealDate;
  final MealTime mealTime;

  Meal(this.id, this.dishes, this.mealDate, this.mealTime);
}
