import 'package:pg_slema/features/ingredient/logic/converter/ingredient_dto_to_json_converter.dart';
import 'package:pg_slema/features/ingredient/logic/converter/ingredient_to_dto_converter.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_dto.dart';
import 'package:pg_slema/features/ingredient/logic/repository/ingredient_repository.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesIngredientRepository
    extends SharedPreferencesCrudRepository<IngredientDto>
    with IngredientRepository {
  final IngredientToDtoConverter converter;

  SharedPreferencesIngredientRepository(this.converter)
      : super(IngredientDtoToJsonConverter(),
            Ingredient.ingredientListSharedPrefKey);

  @override
  Future addIngredient(Ingredient ingredient) async {
    var dto = converter.toDto(ingredient);
    await addDto(dto);
  }

  @override
  Future deleteIngredient(String id) async {
    await deleteDto(id);
  }

  @override
  Future<List<Ingredient>> getAllIngredients() async {
    var dto = await getAllDto();
    return dto.map((dto) => converter.fromDto(dto)).toList(growable: true);
  }

  @override
  Future<List<Ingredient>> getAllDishesByIngredientCategory(
      String ingredientCategoryId) async {
    var dto = await getAllDto();
    return dto
        .where((dto) => dto.categoryId == ingredientCategoryId)
        .map((dto) => converter.fromDto(dto))
        .toList(growable: true);
  }

  @override
  Future<Ingredient> getIngredient(String id) async {
    var dto = await getDto(id);
    return converter.fromDto(dto);
  }

  @override
  Future updateIngredient(Ingredient ingredient) async {
    var dto = converter.toDto(ingredient);
    await updateDto(dto);
  }

  @override
  Future addAllIngredientsFrom(List<Ingredient> ingredients) async {
    var dto = ingredients.map((e) => converter.toDto(e)).toList(growable: true);
    await addAllFrom(dto);
  }

  @override
  Future updateAllIngredientsFrom(List<Ingredient> ingredients) async {
    var dto = ingredients.map((e) => converter.toDto(e)).toList(growable: true);
    await updateAllFrom(dto);
  }
}
