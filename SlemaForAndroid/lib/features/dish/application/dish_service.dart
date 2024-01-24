import 'package:pg_slema/features/dish/data/repository/dish_repository.dart';
import 'package:pg_slema/features/dish/domain/dish.dart';

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

  Future deleteDish(Dish dish) async {
    await repository.deleteDish(dish);
  }

  Future addMultipleDishes(List<Dish> dishes) async {
    await repository.addMultipleDishes(dishes);
  }
}
