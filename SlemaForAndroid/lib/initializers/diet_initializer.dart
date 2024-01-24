import 'package:pg_slema/features/dish/application/dish_service.dart';
import 'package:pg_slema/features/dish/domain/dish.dart';
import 'package:pg_slema/features/dish_category/application/dish_category_name.dart';
import 'package:pg_slema/features/dish_category/application/dish_category_service.dart';
import 'package:pg_slema/features/dish_category/data/repository/shared_preferences_dish_category_repository.dart';
import 'package:pg_slema/features/dish_category/domain/converter/dish_category_to_dto.dart';
import 'package:pg_slema/features/dish_category/domain/dish_category.dart';
import 'package:pg_slema/initializers/initializer.dart';
import 'package:uuid/uuid.dart';

class DietInitializer with Initializer {
  final DishCategoryService dishCategoryService;
  final DishService dishService;
  final Uuid idGenerator;

  DietInitializer(this.dishService)
      : idGenerator = const Uuid(),
        dishCategoryService = DishCategoryService(
            SharedPreferencesDishCategoryRepository(
                DishCategoryToDtoConverter()),
            dishService);

  @override
  Future initialize() async {
    await initializeFruit();
  }

  Future initializeFruit() async {
    DishCategory fruitCategory = await getCategoryByName('Owoce');
    var fruit = generateFruit(fruitCategory.id); //TODO: generate from array
    var currentFruit =
        await dishService.getAllDishesByDishCategory(fruitCategory.id);
    var fruitToUpdate =
        fruit.where((e) => currentFruit.contains(e)).toList(growable: true);
    var fruitToAdd =
        fruit.where((e) => !currentFruit.contains(e)).toList(growable: true);
    //TODO; update multiple fruit
    await dishService.addMultipleDishes(fruitToAdd);
  }

  Future<DishCategory> getCategoryByName(String name) async {
    try {
      var category = DishCategory(idGenerator.v4(), name);
      await dishCategoryService.addDishCategory(category);
      return category;
    } on DishCategoryNameException {
      return dishCategoryService.getDishCategoryByName(name);
    }
  }

  List<Dish> generateFruit(String categoryId) {
    List<Dish> fruit = [];
    Dish blueberry = Dish(idGenerator.v4(), 'Jagoda', categoryId);
    Dish banana = Dish(idGenerator.v4(), 'Banan', categoryId);
    Dish raspberry = Dish(idGenerator.v4(), 'Malina', categoryId);
    Dish orange = Dish(idGenerator.v4(), 'Pomarańcza', categoryId);
    fruit.add(blueberry);
    fruit.add(banana);
    fruit.add(raspberry);
    fruit.add(orange);
    return fruit;
  }

  void initializeVegetables(DishCategory vegetables) {}
}
