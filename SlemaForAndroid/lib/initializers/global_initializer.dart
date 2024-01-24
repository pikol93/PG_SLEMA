import 'package:pg_slema/features/dish/application/dish_service.dart';
import 'package:pg_slema/features/dish/data/repository/shared_preferences_dish_repository.dart';
import 'package:pg_slema/features/dish/domain/converter/dish_to_dto_converter.dart';
import 'package:pg_slema/initializers/diet_initializer.dart';
import 'package:pg_slema/initializers/initializer.dart';

class GlobalInitializer with Initializer {
  final DietInitializer dietInitializer;

  GlobalInitializer()
      : dietInitializer = DietInitializer(
            DishService(SharedPreferencesDishRepository(DishToDtoConverter())));

  @override
  Future initialize() async {
    await dietInitializer.initialize();
  }
}
