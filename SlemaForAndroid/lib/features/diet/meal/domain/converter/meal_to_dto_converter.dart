import 'package:pg_slema/features/diet/dish/application/dish_service.dart';
import 'package:pg_slema/features/diet/dish/domain/dish.dart';
import 'package:pg_slema/features/diet/meal/data/dto/meal_dto.dart';
import 'package:pg_slema/features/diet/meal/domain/meal.dart';

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
