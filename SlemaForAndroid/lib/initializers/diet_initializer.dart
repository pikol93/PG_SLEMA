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
    await initializeDishesForCategory(
        'Owoce', ['Jagoda', 'Banan', 'Malina', 'Pomarańcza', 'Mandarynka']);
    await initializeDishesForCategory(
        'Warzywa', ['Ogórek', 'Brokuł', 'Kalafior', 'Marchew', 'Burak']);
    await initializeDishesForCategory(
        'Nabiał', ['Twaróg', 'Ser żółty', 'Mleko']);
    await initializeDishesForCategory('Mięso', [
      'Wieprzowina',
      'Wołowina',
      'Kurczak',
      'Indyk',
      'Cielęcina',
      'Baranina'
    ]);
  }

  Future initializeDishesForCategory(
      String categoryName, List<String> names) async {
    DishCategory dishCategory = await getCategoryByName(categoryName);
    var dish = generateDishes(names, dishCategory.id);
    var currentDishes = await dishService
        .getAllDishesByDishCategory(dishCategory.id)
        .then((value) => value.map((e) => e.name));
    var dishToAdd = dish
        .where((e) => !currentDishes.contains(e.name))
        .toList(growable: true);
    await dishService.addAllDishesFrom(dishToAdd);
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

  List<Dish> generateDishes(List<String> names, String categoryId) {
    return names
        .map((e) => Dish(idGenerator.v4(), e, categoryId))
        .toList(growable: true);
  }
}
