import 'package:pg_slema/features/ingredient/logic/converter/ingredient_to_dto_converter.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/repository/shared_preferences_ingredient_repository.dart';
import 'package:pg_slema/features/ingredient/logic/service/ingredient_service.dart';
import 'package:pg_slema/features/dish_category/logic/converter/ingredient_category_to_dto.dart';
import 'package:pg_slema/features/dish_category/logic/entity/ingredient_category.dart';
import 'package:pg_slema/features/dish_category/logic/repository/shared_preferences_ingredient_category_repository.dart';
import 'package:pg_slema/features/dish_category/logic/service/ingredient_category_service.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class SelectDishesController {
  final Function onDishCategoriesChanged;
  final Map<MealTime, List<Ingredient>> selectedDishes;
  late final IngredientService dishService;
  late List<DishCategory> mainCategories;
  late final DishCategoryService dishCategoryService;
  late MealTime currentMealTime;

  SelectDishesController(this.onDishCategoriesChanged, this.selectedDishes) {
    currentMealTime = MealTime.firstMeal;
    mainCategories = List.empty();
    final dishConverter = IngredientToDtoConverter();
    final dishRepository = SharedPreferencesIngredientRepository(dishConverter);
    dishService = IngredientService(dishRepository);
    final converter = DishCategoryToDtoConverter();
    final repository = SharedPreferencesDishCategoryRepository(converter);
    dishCategoryService = DishCategoryService(repository, dishService);
  }

  void initialize() {
    dishCategoryService
        .getMainCategories()
        .then((value) => mainCategories = value)
        .then((value) => onDishCategoriesChanged());
  }

  void onMealTimeChanged(MealTime mealTime) {
    currentMealTime = mealTime;
  }

  void onDishAdded(Ingredient dish) {
    selectedDishes[currentMealTime]!.add(dish);
  }

  void onDishRemoved(String dishId) {
    selectedDishes[currentMealTime]!.removeWhere((e) => e.id == dishId);
  }

  List<Ingredient> getSelectedDishesForCategory(String categoryId) {
    var dishes = selectedDishes[currentMealTime];
    return dishes!
        .where((element) => element.categoryId == categoryId)
        .toList(growable: true);
  }
}
