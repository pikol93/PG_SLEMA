import 'package:pg_slema/features/diet/dish/data/dto/converter/dish_dto_to_json_converter.dart';
import 'package:pg_slema/features/diet/dish/data/dto/dish_dto.dart';
import 'package:pg_slema/features/diet/dish/data/repository/dish_repository.dart';
import 'package:pg_slema/features/diet/dish/domain/converter/dish_to_dto_converter.dart';
import 'package:pg_slema/features/diet/dish/domain/dish.dart';
import 'package:pg_slema/features/diet/dish_category/domain/dish_category.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesDishRepository
    extends SharedPreferencesCrudRepository<DishDto> with DishRepository {
  final DishToDtoConverter converter;

  SharedPreferencesDishRepository(this.converter)
      : super(DishDtoToJsonConverter(), Dish.dishListSharedPrefKey);

  @override
  Future addDish(Dish dish) {
    // TODO: implement addDish
    throw UnimplementedError();
  }

  @override
  Future deleteDish(Dish dish) {
    // TODO: implement deleteDish
    throw UnimplementedError();
  }

  @override
  Future<List<Dish>> getAllDishes() {
    // TODO: implement getAllDishes
    throw UnimplementedError();
  }

  @override
  Future<List<Dish>> getAllDishesByCategory(DishCategory category) {
    // TODO: implement getAllDishesByCategory
    throw UnimplementedError();
  }

  @override
  Future<Dish> getDish(String id) {
    // TODO: implement getDish
    throw UnimplementedError();
  }

  @override
  Future updateDish(Dish dish) {
    // TODO: implement updateDish
    throw UnimplementedError();
  }
}
