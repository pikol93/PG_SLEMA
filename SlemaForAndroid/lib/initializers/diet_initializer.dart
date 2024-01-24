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
    var dishes = await dishService.getAllDishes();
    dishes = await dishService.getAllDishesByDishCategory(categories[0].id);
    await initializeFruit();
  }

  Future initializeFruit() async {
    DishCategory fruit = DishCategory(idGenerator.v4(), 'Owoce');
    Dish blueberry = Dish(idGenerator.v4(), 'Jagoda', fruit.id);
    Dish banana = Dish(idGenerator.v4(), 'Banan', fruit.id);
    Dish raspberry = Dish(idGenerator.v4(), 'Malina', fruit.id);
    Dish orange = Dish(idGenerator.v4(), 'Pomarańcza', fruit.id);
    await dishCategoryService.addDishCategory(fruit);
    await dishService.addDish(blueberry);
    await dishService.addDish(banana);
    await dishService.addDish(raspberry);
    await dishService.addDish(orange);
    //TODO: add to list and one await - upgrade
  }

  void initializeVegetables(DishCategory vegetables) {}

  bool _isCategoryWithSpecifiedNamePresent(
      List<DishCategory> categories, String name) {
    return categories.where((element) => element.name == name).isNotEmpty;
  }
}
