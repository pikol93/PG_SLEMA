import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';

class IngredientCategory {
  static String ingredientCategoryListSharedPrefKey = "ingredientcategories";
  final String id;
  final String name;
  final String? parentCategoryId;
  List<IngredientCategory>? subcategories;
  List<Ingredient>? ingredients;

  IngredientCategory(this.id, this.name,
      {this.parentCategoryId, this.subcategories, this.ingredients});
}
