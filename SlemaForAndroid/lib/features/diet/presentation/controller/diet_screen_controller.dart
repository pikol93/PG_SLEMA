import 'dart:collection';

import 'package:pg_slema/features/dish/logic/converter/dish_to_dto_converter.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish/logic/repository/shared_preferences_dish_repository.dart';
import 'package:pg_slema/features/dish/logic/service/dish_service.dart';
import 'package:pg_slema/features/meal/logic/converter/meal_to_dto_converter.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';
import 'package:pg_slema/features/meal/logic/repository/shared_preferences_meal_repository.dart';
import 'package:pg_slema/features/meal/logic/service/meal_service.dart';
import 'package:uuid/uuid.dart';

class DietScreenController {
  late DateTime date;
  late final MealService mealService;
  late LinkedHashMap<MealTime, List<Meal>> meals;
  final Function onMealsChanged;

  DietScreenController(this.onMealsChanged) : super() {
    meals = LinkedHashMap();
    date = DateTime.now();
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
    this.date = date;
    meals = await mealService.getGroupedMealsByDate(date);
    onMealsChanged();
  }

  void updateMeals(Map<MealTime, List<Dish>> dishes) async {
    for (var entry in dishes.entries) {
      var dishesIds = entry.value.map((e) => e.id).toList();
      await _removeNotSelectedMeals(entry.key, dishesIds);
      await _createMissingMeals(entry.key, entry.value);
    }
    onMealsChanged();
  }

  Future _removeNotSelectedMeals(
      MealTime mealTime, List<String> dishesIds) async {
    var idsToRemove = meals[mealTime]!
        .map((e) => e.id)
        .where((id) => !dishesIds.contains(id))
        .toList(growable: true);
    await mealService.deleteMeals(idsToRemove);
    meals[mealTime]!.removeWhere((element) => idsToRemove.contains(element.id));
  }

  Future _createMissingMeals(MealTime mealTime, List<Dish> dishes) async {
    var idGenerator = const Uuid();
    var currentDishes = meals[mealTime]!.map((e) => e.dishes.id).toList();
    var dishesToAdd = dishes
        .where((element) => !currentDishes.contains(element.id))
        .toList(growable: true);
    var mealsToAdd = dishesToAdd
        .map((e) => Meal(idGenerator.v4(), e, date, mealTime))
        .toList();
    await mealService.addAllFrom(mealsToAdd);
    meals[mealTime]!.addAll(mealsToAdd);
  }
}
