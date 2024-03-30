import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';
import 'package:pg_slema/features/ingredient/logic/service/ingredient_service.dart';
import 'package:pg_slema/features/ingredient/logic/converter/ingredient_category_to_dto.dart';
import 'package:pg_slema/features/ingredient/logic/entity/ingredient_category.dart';
import 'package:pg_slema/features/ingredient/logic/repository/shared_preferences_ingredient_category_repository.dart';
import 'package:pg_slema/features/ingredient/logic/service/ingredient_category_service.dart';
import 'package:pg_slema/features/ingredient/logic/service/exception/ingredient_category_name_exception.dart';
import 'package:pg_slema/features/meal/logic/converter/meal_to_dto_converter.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/repository/shared_preferences_meal_repository.dart';
import 'package:pg_slema/features/meal/logic/service/meal_service.dart';
import 'package:pg_slema/initializers/initializer.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';
import 'package:uuid/uuid.dart';

class DietInitializer with Initializer {
  final IngredientCategoryService ingredientCategoryService;
  final IngredientService ingredientService;
  final Uuid idGenerator;

  DietInitializer(this.ingredientService)
      : idGenerator = const Uuid(),
        ingredientCategoryService = IngredientCategoryService(
            SharedPreferencesIngredientCategoryRepository(
                IngredientCategoryToDtoConverter()),
            ingredientService);

  @override
  Future initialize() async {
    await initializeIngredientsForCategory('Owoce', [
      'Jagoda',
      'Banan',
      'Malina',
      'Pomarańcza',
      'Jabłko',
      'Mandarynka',
      'Truskawka',
      'Winogrono',
      'Arbuz',
      'Ananas',
      'Gruszka',
      'Brzoskwinia',
      'Kiwi',
      'Śliwka',
      'Wiśnia',
      'Cytryna',
      'Liczi',
      'Karambola',
      'Granat',
      'Mango'
    ]);
    await initializeIngredientsForCategory('Warzywa', [
      'Ogórek',
      'Rzodkiewka',
      'Kalafior',
      'Marchew',
      'Burak',
      'Papryka',
      'Pomidor',
      'Cebula',
      'Szpinak',
      'Dynia',
      'Cukinia',
      'Kapusta',
      'Por',
      'Brokuł',
      'Bakłażan'
    ]);

    await initializeIngredientsForCategory('Nabiał', [
      'Twaróg',
      'Ser żółty',
      'Ser pleśniowy',
      'Mleko',
      'Masło',
      'Jogurt',
      'Śmietana',
      'Ser feta',
      'Kefir',
      'Jajka',
    ]);

    await initializeIngredientsForCategory('Mięso', [
      'Wieprzowina',
      'Wołowina',
      'Kurczak',
      'Indyk',
      'Cielęcina',
      'Baranina',
      'Kaczka',
      'Gęś',
      'Królik',
      'Łosoś',
      'Tuńczyk',
      'Krewetki',
      'Śledź',
      'Żeberka',
      'Kiełbasa',
      'Szynka'
    ]);
    await initializeMeals(false);
  }

  Future initializeIngredientsForCategory(
      String categoryName, List<String> names) async {
    IngredientCategory ingredientCategory =
        await getCategoryByName(categoryName);
    var ingredient = generateIngredients(names, ingredientCategory.id);
    var currentIngredients = await ingredientService
        .getAllIngredientsByIngredientCategory(ingredientCategory.id)
        .then((value) => value.map((e) => e.name));
    var ingredientToAdd = ingredient
        .where((e) => !currentIngredients.contains(e.name))
        .toList(growable: true);
    await ingredientService.addAllIngredientsFrom(ingredientToAdd);
  }

  Future<IngredientCategory> getCategoryByName(String name) async {
    try {
      var category = IngredientCategory(idGenerator.v4(), name);
      await ingredientCategoryService.addIngredientCategory(category);
      return category;
    } on IngredientCategoryNameException {
      return ingredientCategoryService.getIngredientCategoryByName(name);
    }
  }

  List<Ingredient> generateIngredients(List<String> names, String categoryId) {
    return names
        .map((e) => Ingredient(idGenerator.v4(), e, categoryId))
        .toList(growable: true);
  }

  Future initializeMeals(bool initialize) async {
    if (initialize) {
      var ingredients = await ingredientService.getAllIngredients();
      var mealService = MealService(SharedPreferencesMealRepository(
          MealToDtoConverter(ingredientService)));
      var meals = await mealService.getAllMeals();
      if (meals.isEmpty) {
        await mealService.addMeal(Meal(idGenerator.v4(), 'Jeden',
            [ingredients[0]], DateTime.now(), MealTime.firstMeal));
        await mealService.addMeal(Meal(idGenerator.v4(), 'Pusty', [],
            DateTime.now(), MealTime.secondMeal));
        await mealService.addMeal(Meal(
            idGenerator.v4(),
            'Dwa',
            [ingredients[1], ingredients[2]],
            DateTime.now(),
            MealTime.thirdMeal));

        await mealService.addMeal(Meal(
            idGenerator.v4(),
            'Duplikat',
            [ingredients[2], ingredients[2]],
            DateTime.now().subtract(const Duration(days: 1)),
            MealTime.thirdMeal));
        await mealService.addMeal(Meal(
            idGenerator.v4(),
            '',
            [ingredients[3]],
            DateTime.now().subtract(const Duration(days: 1)),
            MealTime.fourthMeal));
      }
    }
  }
}
