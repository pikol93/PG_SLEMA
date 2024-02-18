import 'dart:collection';

import 'package:pg_slema/features/dish/logic/converter/dish_to_dto_converter.dart';
import 'package:pg_slema/features/dish/logic/repository/shared_preferences_dish_repository.dart';
import 'package:pg_slema/features/dish/logic/service/dish_service.dart';
import 'package:pg_slema/features/meal/logic/converter/meal_to_dto_converter.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';
import 'package:pg_slema/features/meal/logic/repository/shared_preferences_meal_repository.dart';
import 'package:pg_slema/features/meal/logic/service/meal_service.dart';

class MealsInDayController {
  late final MealService mealService;
  late LinkedHashMap<MealTime, List<Meal>> meals;
  final Function onMealsChanged;

  MealsInDayController(this.onMealsChanged) : super() {
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
