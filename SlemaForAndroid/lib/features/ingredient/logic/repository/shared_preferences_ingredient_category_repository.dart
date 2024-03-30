import 'package:pg_slema/features/ingredient/logic/converter/ingredient_category_dto_to_json_converter.dart';
import 'package:pg_slema/features/ingredient/logic/converter/ingredient_category_to_dto.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category_dto.dart';
import 'package:pg_slema/features/ingredient/logic/repository/ingredient_category_repository.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesIngredientCategoryRepository
    extends SharedPreferencesCrudRepository<IngredientCategoryDto>
    with IngredientCategoryRepository {
  final IngredientCategoryToDtoConverter converter;

  SharedPreferencesIngredientCategoryRepository(this.converter)
      : super(IngredientCategoryDtoToJsonConverter(),
            IngredientCategory.ingredientCategoryListSharedPrefKey);

  @override
  Future addIngredientCategory(IngredientCategory ingredientCategory) async {
    var dto = converter.toDto(ingredientCategory);
    await addDto(dto);
  }

  @override
  Future deleteIngredientCategory(String id) async {
    await deleteDto(id);
  }

  @override
  Future<IngredientCategory> getCategory(String ingredientCategoryId) async {
    var dto = await getDto(ingredientCategoryId);
    return converter.fromDto(dto);
  }

  @override
  Future<List<IngredientCategory>> getSubcategoriesByIngredientCategory(
      String? ingredientCategoryId) async {
    var dto = await getAllDto();
    return dto
        .where((element) => element.parentCategoryId == ingredientCategoryId)
        .map((e) => converter.fromDto(e))
        .toList(growable: true);
  }

  @override
  Future updateIngredientCategory(IngredientCategory ingredientCategory) async {
    var dto = converter.toDto(ingredientCategory);
    await updateDto(dto);
  }

  @override
  Future<List<IngredientCategory>> getAllCategories() async {
    var dto = await getAllDto();
    return dto.map((e) => converter.fromDto(e)).toList(growable: true);
  }
}
