import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category_dto.dart';

class IngredientCategoryToDtoConverter {
  IngredientCategory fromDto(IngredientCategoryDto dto) {
    return IngredientCategory(dto.id, dto.name,
        parentCategoryId: dto.parentCategoryId);
  }

  IngredientCategoryDto toDto(IngredientCategory dishCategory) {
    return IngredientCategoryDto(dishCategory.id, dishCategory.name,
        parentCategoryId: dishCategory.parentCategoryId);
  }
}
