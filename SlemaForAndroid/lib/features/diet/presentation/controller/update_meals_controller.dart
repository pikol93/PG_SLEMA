import 'package:pg_slema/features/ingredient/logic/converter/ingredient_to_dto_converter.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/repository/shared_preferences_ingredient_repository.dart';
import 'package:pg_slema/features/ingredient/logic/service/ingredient_service.dart';
import 'package:pg_slema/features/ingredient/logic/converter/ingredient_category_to_dto.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';
import 'package:pg_slema/features/ingredient/logic/repository/shared_preferences_ingredient_category_repository.dart';
import 'package:pg_slema/features/ingredient/logic/service/ingredient_category_service.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class UpdateMealsController {
  final Function onIngredientCategoriesChanged;
  final Map<MealTime, Meal> meals;
  late final IngredientService ingredientService;
  late final IngredientCategoryService ingredientCategoryService;
  late List<IngredientCategory> mainCategories;
  late MealTime currentMealTime;

  UpdateMealsController(
      this.onIngredientCategoriesChanged, this.meals, MealTime mealTime) {
    currentMealTime = mealTime;
    mainCategories = List.empty();
    final ingredientConverter = IngredientToDtoConverter();
    final ingredientRepository =
        SharedPreferencesIngredientRepository(ingredientConverter);
    ingredientService = IngredientService(ingredientRepository);
    final converter = IngredientCategoryToDtoConverter();
    final repository = SharedPreferencesIngredientCategoryRepository(converter);
    ingredientCategoryService =
        IngredientCategoryService(repository, ingredientService);
  }

  void initialize() {
    ingredientCategoryService
        .getMainCategories()
        .then((value) => mainCategories = value)
        .then((value) => onIngredientCategoriesChanged());
  }

  void onMealTimeChanged(MealTime mealTime) {
    currentMealTime = mealTime;
  }

  void onIngredientAdded(Ingredient ingredient) {
    meals[currentMealTime]!.ingredients.add(ingredient);
  }

  void onIngredientRemoved(String ingredientId) {
    meals[currentMealTime]!
        .ingredients
        .removeWhere((e) => e.id == ingredientId);
  }

  List<Ingredient> getSelectedIngredientsForCategory(String categoryId) {
    var ingredients = meals[currentMealTime]!.ingredients;
    return ingredients
        .where((element) => element.categoryId == categoryId)
        .toList(growable: true);
  }
}
