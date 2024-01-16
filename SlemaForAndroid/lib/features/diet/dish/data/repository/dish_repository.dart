import 'package:pg_slema/features/diet/dish/domain/dish.dart';

mixin DishRepository {
  Future<List<Dish>> getAllDishes();

  Future<List<Dish>> getAllDishesByDishCategory(String dishCategoryId);

  Future<Dish> getDish(String id);

  Future addDish(Dish dish);

  Future updateDish(Dish dish);

  Future deleteDish(Dish dish);
}
