import 'package:pg_slema/features/diet/dish/domain/dish.dart';
import 'package:pg_slema/utils/dish_times/meal_time.dart';

class Meal {
  final Dish dish;
  final DateTime mealDate;
  final MealTime mealTime;

  Meal(this.dish, this.mealDate, this.mealTime);
}
