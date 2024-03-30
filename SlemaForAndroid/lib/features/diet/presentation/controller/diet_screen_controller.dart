import 'dart:collection';

import 'package:pg_slema/features/ingredient/logic/converter/ingredient_to_dto_converter.dart';
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
  late LinkedHashMap<MealTime, Meal?> meals;
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

  void updateMeals(Map<MealTime, Meal> meals) async {
    for (var entry in meals.entries) {
      Meal meal = entry.value;
      if (_shouldMealBeDeleted(meal)) {
        await _deleteMeal(entry.key, meal);
      } else if (_shouldMealBeUpdated(meal)) {
        await _updateMeal(entry.key, meal);
      } else if (_shouldMealBeCreated(meal)) {
        await _createMeal(entry.key, meal);
      }
    }
    onMealsChanged();
  }

  bool _shouldMealBeDeleted(Meal meal) {
    return meal.id != "" && meal.title == "" && meal.ingredients.isEmpty;
  }

  bool _shouldMealBeUpdated(Meal meal) {
    return meal.id != "" && (meal.title != "" || meal.ingredients.isNotEmpty);
  }

  bool _shouldMealBeCreated(Meal meal) {
    return meal.id == "" && (meal.title != "" || meal.ingredients.isNotEmpty);
  }

  Future _deleteMeal(MealTime mealTime, Meal meal) async {
    await mealService.deleteMeal(meal.id);
    meals[mealTime] = null;
  }

  Future _updateMeal(MealTime mealTime, Meal meal) async {
    await _removeNotSelectedIngredientsFromMeal(mealTime, meal);
    await _createMissingIngredients(mealTime, meal);
    await mealService.updateMeal(meals[mealTime]!);
  }

  Future _createMeal(MealTime mealTime, Meal meal) async {
    var idGenerator = const Uuid();
    Meal newMeal =
        Meal(idGenerator.v4(), meal.title, meal.ingredients, date, mealTime);
    await mealService.addMeal(newMeal);
    meals[mealTime] = newMeal;
  }

  Future _removeNotSelectedIngredientsFromMeal(
      MealTime mealTime, Meal meal) async {
    var selectedIds = meal.ingredients.map((e) => e.id).toList(growable: true);
    meals[mealTime]!
        .ingredients
        .removeWhere((e) => !selectedIds.contains(e.id));
  }

  Future _createMissingIngredients(MealTime mealTime, Meal meal) async {
    var currentIngredients =
        meals[mealTime]!.ingredients.map((e) => e.id).toList();
    var ingredientsToAdd = meal.ingredients
        .where((element) => !currentIngredients.contains(element.id))
        .toList(growable: true);
    meals[mealTime]!.ingredients.addAll(ingredientsToAdd);
  }
}
