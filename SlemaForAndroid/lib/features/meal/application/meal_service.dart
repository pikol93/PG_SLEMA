import 'package:pg_slema/features/meal/data/repository/meal_repository.dart';
import 'package:pg_slema/features/meal/domain/meal.dart';

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
}
