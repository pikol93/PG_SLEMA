import 'package:pg_slema/features/dish/application/dish_service.dart';
import 'package:pg_slema/features/dish_category/data/repository/dish_category_repository.dart';
import 'package:pg_slema/features/dish_category/domain/dish_category.dart';

class DishCategoryService {
  final DishCategoryRepository repository;
  final DishService dishService;

  DishCategoryService(this.repository, this.dishService);

  Future addDishCategory(DishCategory category) async {
    await repository.addDishCategory(category);
  }

  Future deleteDishCategory(DishCategory category) async {
    await repository.deleteDishCategory(category);
  }

  Future updateDishCategory(DishCategory category) async {
    await repository.updateDishCategory(category);
  }

  Future<DishCategory> getDishCategory(String dishCategoryId) async {
    DishCategory category = await repository.getCategory(dishCategoryId);
    category.subcategories =
        await repository.getSubcategoriesByDishCategory(dishCategoryId);
    category.dishes =
        await dishService.getAllDishesByDishCategory(dishCategoryId);
    return category;
  }

  Future<List<DishCategory>> getMainCategories() async {
    return await repository.getSubcategoriesByDishCategory(null);
  }
}
