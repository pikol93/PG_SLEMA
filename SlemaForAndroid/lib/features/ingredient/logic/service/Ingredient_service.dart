import 'package:pg_slema/features/ingredient/logic/repository/Ingredient_repository.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';

class IngredientService {
  final IngredientRepository repository;

  IngredientService(this.repository);

  Future<List<Ingredient>> getAllIngredients() async {
    return await repository.getAllIngredients();
  }

  Future<List<Ingredient>> getAllIngredientsByIngredientCategory(
      String ingredientCategoryId) async {
    return await repository
        .getAllDishesByIngredientCategory(ingredientCategoryId);
  }

  Future<Ingredient> getIngredient(String id) async {
    return await repository.getIngredient(id);
  }

  Future addIngredient(Ingredient ingredient) async {
    await repository.addIngredient(ingredient);
  }

  Future updateIngredient(Ingredient ingredient) async {
    await repository.updateIngredient(ingredient);
  }

  Future deleteIngredient(String id) async {
    await repository.deleteIngredient(id);
  }

  Future addAllIngredientsFrom(List<Ingredient> ingredients) async {
    await repository.addAllIngredientsFrom(ingredients);
  }

  Future updateAllIngredientsFrom(List<Ingredient> ingredients) async {
    await repository.updateAllIngredientsFrom(ingredients);
  }
}
