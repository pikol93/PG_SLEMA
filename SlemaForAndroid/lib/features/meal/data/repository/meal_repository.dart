import 'package:pg_slema/features/diet/meal/domain/meal.dart';

mixin MealRepository {
  Future updateMeal(Meal meal);

  Future addMeal(Meal meal);

  Future deleteMeal(Meal meal);

  Future<List<Meal>> getAllMeals();

  Future<List<Meal>> getAllMealsByDate(DateTime date);
}
