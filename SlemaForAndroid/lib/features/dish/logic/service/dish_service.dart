import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish/logic/repository/dish_repository.dart';

class DishService {
  final DishRepository repository;

  DishService(this.repository);

  Future<List<Dish>> getAllDishes() async {
    return await repository.getAllDishes();
  }

  Future<List<Dish>> getAllDishesByDishCategory(String dishCategoryId) async {
    return await repository.getAllDishesByDishCategory(dishCategoryId);
  }

  Future<Dish> getDish(String id) async {
    return await repository.getDish(id);
  }

  Future addDish(Dish dish) async {
    await repository.addDish(dish);
  }

  Future updateDish(Dish dish) async {
    await repository.updateDish(dish);
  }

  Future deleteDish(String id) async {
    await repository.deleteDish(id);
  }

  Future addAllDishesFrom(List<Dish> dishes) async {
    await repository.addAllDishesFrom(dishes);
  }

  Future updateAllDishesFrom(List<Dish> dishes) async {
    await repository.updateAllDishesFrom(dishes);
  }
}
