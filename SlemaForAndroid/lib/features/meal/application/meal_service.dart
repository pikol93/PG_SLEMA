import 'package:pg_slema/features/meal/data/repository/meal_repository.dart';
import 'package:pg_slema/features/meal/domain/meal.dart';
import 'package:pg_slema/utils/meal_time/meal_time.dart';

class MealService {
  final MealRepository repository;

  MealService(this.repository);

  Future updateMeal(Meal meal) async {
    await repository.updateMeal(meal);
  }

  Future addMeal(Meal meal) async {
    await repository.addMeal(meal);
  }

  Future deleteMeal(Meal meal) async {
    await repository.deleteMeal(meal);
  }

  Future<List<Meal>> getAllMeals() async {
    return await repository.getAllMeals();
  }

  Future<List<Meal>> getAllMealsByDate(DateTime date) async {
    return await repository.getAllMealsByDate(date);
  }

  Future<Map<MealTime, List<Meal>>> groupMealsByMealTime(
      List<Meal> meals) async {
    Map<MealTime, List<Meal>> groupedMeals = {};
    for (var meal in meals) {
      groupedMeals.putIfAbsent(meal.mealTime, () => []).add(meal);
    }
    return groupedMeals;
  }

  Future<Map<MealTime, List<Meal>>> getGroupedMealsByDate(DateTime date) async {
    var meals = await getAllMealsByDate(date);
    return groupMealsByMealTime(meals);
  }
}
