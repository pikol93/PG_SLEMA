import 'package:pg_slema/features/diet/meal/data/repository/meal_repository.dart';
import 'package:pg_slema/features/diet/meal/domain/meal.dart';

class MealService {
  final MealRepository repository;

  MealService(this.repository);

  Future updateMeal(Meal meal) async {
    return await repository.updateMeal(meal);
  }

  Future addMeal(Meal meal) async {
    return await repository.addMeal(meal);
  }

  Future deleteMeal(Meal meal) async {
    return await repository.deleteMeal(meal);
  }

  Future<List<Meal>> getAllMeals() async {
    return await repository.getAllMeals();
  }

  Future<List<Meal>> getAllMealsByDate(DateTime date) async {
    return await repository.getAllMealsByDate(date);
  }
}
