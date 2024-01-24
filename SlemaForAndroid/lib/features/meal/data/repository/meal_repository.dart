import 'package:pg_slema/features/meal/domain/meal.dart';

mixin MealRepository {
  Future updateMeal(Meal meal);

  Future addMeal(Meal meal);

  Future addMultipleMeals(List<Meal> meals);

  Future deleteMeal(Meal meal);

  Future<List<Meal>> getAllMeals();

  Future<List<Meal>> getAllMealsByDate(DateTime date);
}
