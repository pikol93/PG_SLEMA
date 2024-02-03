import 'package:pg_slema/features/dish_category/domain/dish_category.dart';

mixin DishCategoryRepository {
  Future addDishCategory(DishCategory dishCategory);
  Future updateDishCategory(DishCategory dishCategory);
  Future deleteDishCategory(String id);
  Future<DishCategory> getCategory(String dishCategoryId);
  Future<List<DishCategory>> getAllCategories();
  Future<List<DishCategory>> getSubcategoriesByDishCategory(
      String? dishCategoryId);
}
