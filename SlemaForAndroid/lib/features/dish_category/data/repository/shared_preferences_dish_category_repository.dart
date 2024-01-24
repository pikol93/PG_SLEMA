import 'package:pg_slema/features/dish_category/data/dto/converter/dish_category_dto_to_json_converter.dart';
import 'package:pg_slema/features/dish_category/data/dto/dish_category_dto.dart';
import 'package:pg_slema/features/dish_category/data/repository/dish_category_repository.dart';
import 'package:pg_slema/features/dish_category/domain/converter/dish_category_to_dto.dart';
import 'package:pg_slema/features/dish_category/domain/dish_category.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesDishCategoryRepository
    extends SharedPreferencesCrudRepository<DishCategoryDto>
    with DishCategoryRepository {
  final DishCategoryToDtoConverter converter;

  SharedPreferencesDishCategoryRepository(this.converter)
      : super(DishCategoryDtoToJsonConverter(),
            DishCategory.dishCategoryListSharedPrefKey);

  @override
  Future addDishCategory(DishCategory dishCategory) async {
    var dto = converter.toDto(dishCategory);
    await addDto(dto);
  }

  @override
  Future deleteDishCategory(DishCategory dishCategory) async {
    var dto = converter.toDto(dishCategory);
    await deleteDto(dto);
  }

  @override
  Future<DishCategory> getCategory(String dishCategoryId) async {
    var dto = await getDto(dishCategoryId);
    return converter.fromDto(dto);
  }

  @override
  Future<List<DishCategory>> getSubcategoriesByDishCategory(
      String? dishCategoryId) async {
    var dto = await getAllDto();
    return dto
        .where((element) => element.parentCategoryId == dishCategoryId)
        .map((e) => converter.fromDto(e))
        .toList(growable: true);
  }

  @override
  Future updateDishCategory(DishCategory dishCategory) async {
    var dto = converter.toDto(dishCategory);
    await updateDto(dto);
  }

  @override
  Future<List<DishCategory>> getAllCategories() async {
    var dto = await getAllDto();
    return dto.map((e) => converter.fromDto(e)).toList(growable: true);
  }
}
