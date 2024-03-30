import 'package:pg_slema/features/ingredient/logic/service/ingredient_service.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';
import 'package:pg_slema/features/ingredient/logic/repository/ingredient_category_repository.dart';
import 'package:pg_slema/features/ingredient/logic/service/exception/ingredient_category_name_exception.dart';

class IngredientCategoryService {
  final IngredientCategoryRepository repository;
  final IngredientService ingredientService;

  IngredientCategoryService(this.repository, this.ingredientService);

  Future addIngredientCategory(IngredientCategory category) async {
    var categories = await repository.getAllCategories();
    if (_isCategoryWithSpecifiedNamePresent(categories, category.name)) {
      throw IngredientCategoryNameException('Nazwa jest zajęta');
    }
    await repository.addIngredientCategory(category);
  }

  Future deleteIngredientCategory(String id) async {
    await repository.deleteIngredientCategory(id);
  }

  Future updateIngredientCategory(IngredientCategory category) async {
    var categories = await repository.getAllCategories();
    var oldCategory = await getIngredientCategory(category.id);
    if (oldCategory.name != category.name &&
        _isCategoryWithSpecifiedNamePresent(categories, category.name)) {
      throw IngredientCategoryNameException('Nazwa jest zajęta');
    }
    await repository.updateIngredientCategory(category);
  }

  Future<IngredientCategory> getIngredientCategory(
      String ingredientCategoryId) async {
    IngredientCategory category =
        await repository.getCategory(ingredientCategoryId);
    await addContentToCategory(category);
    return category;
  }

  Future<IngredientCategory> getIngredientCategoryByName(String name) async {
    var categories = await repository.getAllCategories();
    return categories.firstWhere((element) => element.name == name,
        orElse: () =>
            throw IngredientCategoryNameException("Niepoprawna nazwa"));
  }

  Future<List<IngredientCategory>> getMainCategories() async {
    var categories =
        await repository.getSubcategoriesByIngredientCategory(null);
    await Future.forEach(categories, addContentToCategory);
    return categories;
  }

  Future addContentToCategory(IngredientCategory category) async {
    await addIngredientsToCategory(category);
    await addSubcategoriesToCategory(category);
  }

  Future addIngredientsToCategory(IngredientCategory category) async {
    category.ingredients = await ingredientService
        .getAllIngredientsByIngredientCategory(category.id);
  }

  Future addSubcategoriesToCategory(IngredientCategory category) async {
    category.subcategories =
        await repository.getSubcategoriesByIngredientCategory(category.id);
  }

  bool _isCategoryWithSpecifiedNamePresent(
      List<IngredientCategory> categories, String name) {
    return categories.where((element) => element.name == name).isNotEmpty;
  }
}
