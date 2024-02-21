import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish/logic/entity/dish_dto.dart';

class DishToDtoConverter {
  Dish fromDto(DishDto dto) {
    return Dish(dto.id, dto.name, dto.categoryId);
  }

  DishDto toDto(Dish dish) {
    return DishDto(dish.id, dish.name, dish.categoryId);
  }
}
