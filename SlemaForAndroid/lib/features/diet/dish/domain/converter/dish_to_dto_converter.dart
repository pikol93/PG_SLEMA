import 'package:pg_slema/features/diet/dish/data/dto/dish_dto.dart';
import 'package:pg_slema/features/diet/dish/domain/dish.dart';

class DishToDtoConverter {
  Dish fromDto(DishDto dto) {
    return Dish(dto.id, dto.name, dto.categoryId);
  }

  DishDto toDto(Dish dish) {
    return DishDto(dish.id, dish.name, dish.categoryId);
  }
}
