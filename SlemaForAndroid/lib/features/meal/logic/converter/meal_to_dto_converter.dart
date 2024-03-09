import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/service/ingredient_service.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_dto.dart';

class MealToDtoConverter {
  final IngredientService service;

  MealToDtoConverter(this.service);

  Future<Meal> fromDto(MealDto dto) async {
    List<Ingredient> allIngredients = await service.getAllIngredients();
    List<String> allIngredientsIds = allIngredients.map((e) => e.id).toList();
    var ingredients = dto.ingredientsIds
        .where((id) => allIngredientsIds.contains(id))
        .map((e) => allIngredients.firstWhere((element) => element.id == e))
        .toList(growable: true);
    return Meal(dto.id, dto.title, ingredients, dto.mealDate, dto.mealTime);
  }

  MealDto toDto(Meal meal) {
    var ingredientsIds = meal.ingredients.map((e) => e.id).toList();
    return MealDto(
        meal.id, meal.title, ingredientsIds, meal.mealDate, meal.mealTime);
  }
}
