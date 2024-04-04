import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_dto.dart';

class IngredientToDtoConverter {
  Ingredient fromDto(IngredientDto dto) {
    return Ingredient(dto.id, dto.name, dto.categoryId);
  }

  IngredientDto toDto(Ingredient dish) {
    return IngredientDto(dish.id, dish.name, dish.categoryId);
  }
}
