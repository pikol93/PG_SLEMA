import 'package:pg_slema/features/dish_category/logic/entity/dish_category.dart';
import 'package:pg_slema/features/dish_category/logic/entity/dish_category_dto.dart';

class DishCategoryToDtoConverter {
  DishCategory fromDto(DishCategoryDto dto) {
    return DishCategory(dto.id, dto.name,
        parentCategoryId: dto.parentCategoryId);
  }

  DishCategoryDto toDto(DishCategory dishCategory) {
    return DishCategoryDto(dishCategory.id, dishCategory.name,
        parentCategoryId: dishCategory.parentCategoryId);
  }
}
