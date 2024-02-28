import 'dart:collection';

import 'package:pg_slema/features/ingredient/logic/converter/ingredient_to_dto_converter.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/repository/shared_preferences_ingredient_repository.dart';
import 'package:pg_slema/features/ingredient/logic/repository/shared_preferences_ingredient_repository.dart';
import 'package:pg_slema/features/ingredient/logic/service/ingredient_service.dart';
import 'package:pg_slema/features/meal/logic/converter/meal_to_dto_converter.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';
import 'package:pg_slema/features/meal/logic/repository/shared_preferences_meal_repository.dart';
import 'package:pg_slema/features/meal/logic/service/meal_service.dart';
import 'package:uuid/uuid.dart';

class DietScreenController {
  late DateTime date;
  late final MealService mealService;
  late LinkedHashMap<MealTime, Meal> meals;
  final Function onMealsChanged;

  DietScreenController(this.onMealsChanged) : super() {
    meals = LinkedHashMap();
    date = DateTime.now();
    var ingredientConverter = IngredientToDtoConverter();
    var ingredientRepository =
        SharedPreferencesIngredientRepository(ingredientConverter);
    var ingredientService = IngredientService(ingredientRepository);
    var converter = MealToDtoConverter(ingredientService);
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

  void updateMeals(Map<MealTime, List<Ingredient>> ingredients) async {
    for (var entry in ingredients.entries) {
      var ingredientsIds = entry.value.map((e) => e.id).toList();
      await _removeNotSelectedMeals(entry.key, ingredientsIds);
      await _createMissingMeals(entry.key, entry.value);
    }
    onMealsChanged();
  }

  Future _removeNotSelectedMeals(
      MealTime mealTime, List<String> ingredientsIds) async {
    var idsToRemove = meals[mealTime]!
        .map((e) => e.id)
        .where((id) => !ingredientsIds.contains(id))
        .toList(growable: true);
    await mealService.deleteMeals(idsToRemove);
    meals[mealTime]!.removeWhere((element) => idsToRemove.contains(element.id));
  }

  Future _createMissingMeals(
      MealTime mealTime, List<Ingredient> ingredients) async {
    var idGenerator = const Uuid();
    var currentDishes = meals[mealTime]!.map((e) => e.ingredients.id).toList();
    var ingredientsToAdd = ingredients
        .where((element) => !currentDishes.contains(element.id))
        .toList(growable: true);
    var mealsToAdd = ingredientsToAdd
        .map((e) => Meal(idGenerator.v4(), e, date, mealTime))
        .toList();
    await mealService.addAllFrom(mealsToAdd);
    meals[mealTime]!.addAll(mealsToAdd);
  }
}
