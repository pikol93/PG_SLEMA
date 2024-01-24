import 'package:pg_slema/features/dish_category/data/dto/dish_category_dto.dart';
import 'package:pg_slema/features/dish_category/domain/dish_category.dart';

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
