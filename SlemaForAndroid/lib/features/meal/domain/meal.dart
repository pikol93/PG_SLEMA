import 'package:pg_slema/features/dish/domain/dish.dart';
import 'package:pg_slema/utils/meal_time/meal_time.dart';

class Meal {
  static const String mealListSharedPrefKey = 'meals';
  final String id;
  final Dish dish;
  final DateTime mealDate;
  final MealTime mealTime;

  Meal(this.id, this.dish, this.mealDate, this.mealTime);
}
