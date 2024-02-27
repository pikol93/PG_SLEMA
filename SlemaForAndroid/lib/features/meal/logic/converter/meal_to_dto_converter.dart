import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish/logic/service/dish_service.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_dto.dart';

class MealToDtoConverter {
  final DishService service;

  MealToDtoConverter(this.service);

  Future<Meal> fromDto(MealDto dto) async {
    List<Dish> allDishes = await service.getAllDishes();
    var dishes = allDishes
        .where((element) => dto.dishesIds.contains(element.id))
        .toSet();
    return Meal(dto.id, dto.title, dishes, dto.mealDate, dto.mealTime);
  }

  MealDto toDto(Meal meal) {
    var dishesIds = meal.dishes.map((e) => e.id).toSet();
    return MealDto(
        meal.id, meal.title, dishesIds, meal.mealDate, meal.mealTime);
  }
}
