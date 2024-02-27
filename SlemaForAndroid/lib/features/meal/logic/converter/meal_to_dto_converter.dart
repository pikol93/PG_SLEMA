import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish/logic/service/dish_service.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_dto.dart';

class MealToDtoConverter {
  final DishService service;

  MealToDtoConverter(this.service);

  Future<Meal> fromDto(MealDto dto) async {
    List<Dish> allIngredients = await service.getAllDishes();
    var ingredients = allIngredients
        .where((element) => dto.ingredientsIds.contains(element.id))
        .toSet();
    return Meal(dto.id, dto.title, ingredients, dto.mealDate, dto.mealTime);
  }

  MealDto toDto(Meal meal) {
    var ingredientsIds = meal.ingredients.map((e) => e.id).toSet();
    return MealDto(
        meal.id, meal.title, ingredientsIds, meal.mealDate, meal.mealTime);
  }
}
