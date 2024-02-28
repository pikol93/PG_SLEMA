import 'package:pg_slema/features/ingredient_category/logic/entity/ingredient_category.dart';

mixin IngredientCategoryRepository {
  Future addIngredientCategory(IngredientCategory ingredientCategory);
  Future updateIngredientCategory(IngredientCategory ingredientCategory);
  Future deleteIngredientCategory(String id);
  Future<IngredientCategory> getCategory(String ingredientCategoryId);
  Future<List<IngredientCategory>> getAllCategories();
  Future<List<IngredientCategory>> getSubcategoriesByIngredientCategory(
      String? ingredientCategoryId);
}
