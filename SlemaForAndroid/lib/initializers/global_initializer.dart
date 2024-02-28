import 'package:pg_slema/features/ingredient/logic/converter/ingredient_to_dto_converter.dart';
import 'package:pg_slema/features/ingredient/logic/repository/shared_preferences_dish_repository.dart';
import 'package:pg_slema/features/ingredient/logic/service/Ingredient_service.dart';
import 'package:pg_slema/initializers/diet_initializer.dart';
import 'package:pg_slema/initializers/initializer.dart';

class GlobalInitializer with Initializer {
  final DietInitializer dietInitializer;

  GlobalInitializer()
      : dietInitializer = DietInitializer(IngredientService(
            SharedPreferencesIngredientRepository(IngredientToDtoConverter())));

  @override
  Future initialize() async {
    await dietInitializer.initialize();
  }
}
