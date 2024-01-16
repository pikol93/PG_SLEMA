import 'package:pg_slema/features/diet/dish/data/dto/converter/dish_dto_to_json_converter.dart';
import 'package:pg_slema/features/diet/dish/data/dto/dish_dto.dart';
import 'package:pg_slema/features/diet/dish/data/repository/dish_repository.dart';
import 'package:pg_slema/features/diet/dish/domain/converter/dish_to_dto_converter.dart';
import 'package:pg_slema/features/diet/dish/domain/dish.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesDishRepository
    extends SharedPreferencesCrudRepository<DishDto> with DishRepository {
  final DishToDtoConverter converter;

  SharedPreferencesDishRepository(this.converter)
      : super(DishDtoToJsonConverter(), Dish.dishListSharedPrefKey);

  @override
  Future addDish(Dish dish) async {
    var dto = converter.toDto(dish);
    await addDto(dto);
  }

  @override
  Future deleteDish(Dish dish) async {
    var dto = converter.toDto(dish);
    await deleteDto(dto);
  }

  @override
  Future<List<Dish>> getAllDishes() async {
    var dto = await getAllDto();
    return dto.map((dto) => converter.fromDto(dto)).toList(growable: true);
  }

  @override
  Future<List<Dish>> getAllDishesByDishCategory(String dishCategoryId) async {
    var dto = await getAllDto();
    return dto
        .where((dto) => dto.categoryId == dishCategoryId)
        .map((dto) => converter.fromDto(dto))
        .toList(growable: true);
  }

  @override
  Future<Dish> getDish(String id) async {
    var dto = await getDto(id);
    return converter.fromDto(dto);
  }

  @override
  Future updateDish(Dish dish) async {
    var dto = converter.toDto(dish);
    return await updateDto(dto);
  }
}
