import 'package:pg_slema/features/dish/application/dish_service.dart';
import 'package:pg_slema/features/dish_category/application/dish_category_name.dart';
import 'package:pg_slema/features/dish_category/data/repository/dish_category_repository.dart';
import 'package:pg_slema/features/dish_category/domain/dish_category.dart';

class DishCategoryService {
  final DishCategoryRepository repository;
  final DishService dishService;

  DishCategoryService(this.repository, this.dishService);

  Future addDishCategory(DishCategory category) async {
    var categories = await repository.getAllCategories();
    if (_isCategoryWithSpecifiedNamePresent(categories, category.name)) {
      throw DishCategoryNameException('Nazwa jest zajęta');
    }
    await repository.addDishCategory(category);
  }

  Future deleteDishCategory(DishCategory category) async {
    await repository.deleteDishCategory(category);
  }

  Future updateDishCategory(DishCategory category) async {
    var categories = await repository.getAllCategories();
    var oldCategory = await getDishCategory(category.id);
    if (oldCategory.name != category.name &&
        _isCategoryWithSpecifiedNamePresent(categories, category.name)) {
      throw DishCategoryNameException('Nazwa jest zajęta');
    }
    await repository.updateDishCategory(category);
  }

  Future<DishCategory> getDishCategory(String dishCategoryId) async {
    DishCategory category = await repository.getCategory(dishCategoryId);
    await addContentToCategory(category);
    return category;
  }

  Future<List<DishCategory>> getMainCategories() async {
    var categories = await repository.getSubcategoriesByDishCategory(null);
    await Future.forEach(categories, addContentToCategory);
    return categories;
  }

  Future addContentToCategory(DishCategory category) async {
    await addDishesToCategory(category);
    await addSubcategoriesToCategory(category);
  }

  Future addDishesToCategory(DishCategory category) async {
    category.dishes = await dishService.getAllDishesByDishCategory(category.id);
  }

  Future addSubcategoriesToCategory(DishCategory category) async {
    category.subcategories =
        await repository.getSubcategoriesByDishCategory(category.id);
  }

  bool _isCategoryWithSpecifiedNamePresent(
      List<DishCategory> categories, String name) {
    return categories.where((element) => element.name == name).isNotEmpty;
  }
}
