import 'package:pg_slema/features/diet/dish/domain/dish.dart';
import 'package:pg_slema/features/diet/dish_category/domain/dish_category.dart';

mixin DishRepository {
  Future<List<Dish>> getAllDishes();

  Future<List<Dish>> getAllDishesByCategory(DishCategory category);

  Future<Dish> getDish(String id);

  Future addDish(Dish dish);

  Future updateDish(Dish dish);

  Future deleteDish(Dish dish);
}
