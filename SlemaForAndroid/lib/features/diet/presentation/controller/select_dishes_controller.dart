import 'package:pg_slema/features/dish/logic/converter/dish_to_dto_converter.dart';
import 'package:pg_slema/features/dish/logic/entity/dish.dart';
import 'package:pg_slema/features/dish/logic/repository/shared_preferences_dish_repository.dart';
import 'package:pg_slema/features/dish/logic/service/dish_service.dart';
import 'package:pg_slema/features/dish_category/logic/converter/dish_category_to_dto.dart';
import 'package:pg_slema/features/dish_category/logic/entity/dish_category.dart';
import 'package:pg_slema/features/dish_category/logic/repository/shared_preferences_dish_category_repository.dart';
import 'package:pg_slema/features/dish_category/logic/service/dish_category_service.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class SelectDishesController {
  final Function onDishCategoriesChanged;
  final Map<MealTime, List<Dish>> selectedDishes;
  late final DishService dishService;
  late List<DishCategory> mainCategories;
  late final DishCategoryService dishCategoryService;
  late MealTime currentMealTime;

  SelectDishesController(this.onDishCategoriesChanged, this.selectedDishes) {
    currentMealTime = MealTime.firstMeal;
    mainCategories = List.empty();
    final dishConverter = DishToDtoConverter();
    final dishRepository = SharedPreferencesDishRepository(dishConverter);
    dishService = DishService(dishRepository);
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

  void onDishAdded(Dish dish) {
    selectedDishes[currentMealTime]!.add(dish);
  }

  void onDishRemoved(String dishId) {
    selectedDishes[currentMealTime]!.removeWhere((e) => e.id == dishId);
  }

  List<Dish> getSelectedDishesForCategory(String categoryId) {
    var dishes = selectedDishes[currentMealTime];
    return dishes!
        .where((element) => element.categoryId == categoryId)
        .toList(growable: true);
  }
}
