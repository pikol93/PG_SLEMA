import 'package:pg_slema/features/dish/application/dish_service.dart';
import 'package:pg_slema/features/dish/domain/dish.dart';
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
    List<DishCategory> categories =
        await dishCategoryService.getMainCategories();
    if (!_isCategoryWithSpecifiedNamePresent(categories, 'Owoce')) {
      await initializeFruit();
    }
    categories = await dishCategoryService.getMainCategories();
  }

  Future initializeFruit() async {
    DishCategory fruitCategory = DishCategory(idGenerator.v4(), 'Owoce');
    var fruit = generateFruit(fruitCategory.id);
    dishService.addDishes(fruit);
    await dishCategoryService.addDishCategory(fruit);
    await dishService.addDish(blueberry);
    await dishService.addDish(banana);
    await dishService.addDish(raspberry);
    await dishService.addDish(orange);
    //TODO: add to list and one await - upgrade
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
