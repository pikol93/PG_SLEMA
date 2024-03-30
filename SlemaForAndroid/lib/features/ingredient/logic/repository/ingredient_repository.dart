import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';

mixin IngredientRepository {
  Future<List<Ingredient>> getAllIngredients();

  Future<List<Ingredient>> getAllDishesByIngredientCategory(
      String ingredientCategoryId);

  Future<Ingredient> getIngredient(String id);

  Future addIngredient(Ingredient ingredient);

  Future updateIngredient(Ingredient ingredient);

  Future deleteIngredient(String id);

  Future addAllIngredientsFrom(List<Ingredient> ingredients);

  Future updateAllIngredientsFrom(List<Ingredient> ingredients);
}
