import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish/logic/service/dish_service.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_dto.dart';

class MealToDtoConverter {
  final DishService service;

  MealToDtoConverter(this.service);

  Future<Meal> fromDto(MealDto dto) async {
    Dish dish = await service.getDish(dto.dishId);
    return Meal(dto.id, dish, dto.mealDate, dto.mealTime);
  }

  MealDto toDto(Meal meal) {
    return MealDto(meal.id, meal.dish.id, meal.mealDate, meal.mealTime);
  }
}
