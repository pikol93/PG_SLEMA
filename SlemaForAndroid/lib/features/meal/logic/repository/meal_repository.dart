import 'package:pg_slema/features/meal/logic/entity/meal.dart';

mixin MealRepository {
  Future updateMeal(Meal meal);

  Future addMeal(Meal meal);

  Future addAllMealsFrom(List<Meal> meals);

  Future deleteMeal(String id);

  Future<List<Meal>> getAllMeals();

  Future<List<Meal>> getAllMealsByDate(DateTime date);

  Future deleteMeals(List<String> idsToRemove);
}
