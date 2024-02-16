import 'package:pg_slema/features/dish/logic/converter/dish_dto_to_json_converter.dart';
import 'package:pg_slema/features/dish/logic/converter/dish_to_dto_converter.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish/logic/entity/dish_dto.dart';
import 'package:pg_slema/features/dish/logic/repository/dish_repository.dart';
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
  Future deleteDish(String id) async {
    await deleteDto(id);
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
    await updateDto(dto);
  }

  @override
  Future addAllDishesFrom(List<Dish> dishes) async {
    var dto = dishes.map((e) => converter.toDto(e)).toList(growable: true);
    await addAllFrom(dto);
  }

  @override
  Future updateAllDishesFrom(List<Dish> dishes) async {
    var dto = dishes.map((e) => converter.toDto(e)).toList(growable: true);
    await updateAllFrom(dto);
  }
}
