import 'package:pg_slema/features/diet/dish/data/repository/dish_repository.dart';
import 'package:pg_slema/features/diet/dish/domain/dish.dart';
import 'package:pg_slema/features/diet/dish_category/domain/dish_category.dart';

class DishService {
  final DishRepository repository;

  DishService(this.repository);

  Future<List<Dish>> getAllDishes() async {
    return await repository.getAllDishes();
  }

  Future<List<Dish>> getAllDishesByCategory(DishCategory category) async {
    return await repository.getAllDishesByCategory(category);
  }

  Future<Dish> getDish(String id) async {
    return await repository.getDish(id);
  }

  Future addDish(Dish dish) async {
    return await repository.addDish(dish);
  }

  Future updateDish(Dish dish) async {
    return await repository.updateDish(dish);
  }

  Future deleteDish(Dish dish) async {
    return await repository.deleteDish(dish);
  }
}
