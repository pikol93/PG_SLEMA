import 'dart:collection';

import 'package:pg_slema/features/dish/application/dish_service.dart';
import 'package:pg_slema/features/dish/data/repository/shared_preferences_dish_repository.dart';
import 'package:pg_slema/features/dish/domain/converter/dish_to_dto_converter.dart';
import 'package:pg_slema/features/meal/application/meal_service.dart';
import 'package:pg_slema/features/meal/data/repository/shared_preferences_meal_repository.dart';
import 'package:pg_slema/features/meal/domain/converter/meal_to_dto_converter.dart';
import 'package:pg_slema/features/meal/domain/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class DietScreenController {
  late final MealService mealService;
  late LinkedHashMap<MealTime, List<Meal>> meals;
  final Function onMealsChanged;

  DietScreenController(this.onMealsChanged) : super() {
    meals = LinkedHashMap();
    var dishConverter = DishToDtoConverter();
    var dishRepository = SharedPreferencesDishRepository(dishConverter);
    var dishService = DishService(dishRepository);
    var converter = MealToDtoConverter(dishService);
    var repository = SharedPreferencesMealRepository(converter);
    mealService = MealService(repository);
  }

  Future initializeMeals() async {
    meals = await mealService.getGroupedMealsByDate(DateTime.now());
    onMealsChanged();
  }

  Future onDateChanged(DateTime date) async {
    meals = await mealService.getGroupedMealsByDate(date);
    onMealsChanged();
  }
}
