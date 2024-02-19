import 'dart:collection';

import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/repository/meal_repository.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class MealService {
  final MealRepository repository;

  MealService(this.repository);

  Future updateMeal(Meal meal) async {
    await repository.updateMeal(meal);
  }

  Future addMeal(Meal meal) async {
    await repository.addMeal(meal);
  }

  Future deleteMeal(String id) async {
    await repository.deleteMeal(id);
  }

  Future addAllFrom(List<Meal> meals) async {
    await repository.addAllMealsFrom(meals);
  }

  Future<List<Meal>> getAllMeals() async {
    return await repository.getAllMeals();
  }

  Future<List<Meal>> getAllMealsByDate(DateTime date) async {
    return await repository.getAllMealsByDate(date);
  }

  Future<LinkedHashMap<MealTime, List<Meal>>> getGroupedMealsByDate(
      DateTime date) async {
    var meals =
        await getAllMealsByDate(DateTime(date.year, date.month, date.day));
    return groupMealsByMealTime(meals);
  }

  Future<LinkedHashMap<MealTime, List<Meal>>> groupMealsByMealTime(
      List<Meal> meals) async {
    LinkedHashMap<MealTime, List<Meal>> groupedMeals = createEmptyMap();
    for (var meal in meals) {
      groupedMeals[meal.mealTime]?.add(meal);
    }
    return groupedMeals;
  }

  LinkedHashMap<MealTime, List<Meal>> createEmptyMap() {
    return LinkedHashMap.fromIterable(MealTime.values,
        key: (key) => key, value: (value) => []);
  }

  Future deleteMeals(List<String> idsToRemove) async {
    return repository.deleteMeals(idsToRemove);
  }
}
