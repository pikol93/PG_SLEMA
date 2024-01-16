import 'package:pg_slema/features/diet/meal/data/dto/converter/meal_dto_to_json_converter.dart';
import 'package:pg_slema/features/diet/meal/data/dto/meal_dto.dart';
import 'package:pg_slema/features/diet/meal/data/repository/meal_repository.dart';
import 'package:pg_slema/features/diet/meal/domain/converter/meal_to_dto_converter.dart';
import 'package:pg_slema/features/diet/meal/domain/meal.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesMealRepository
    extends SharedPreferencesCrudRepository<MealDto> with MealRepository {
  final MealToDtoConverter converter;

  SharedPreferencesMealRepository(this.converter)
      : super(MealDtoToJsonConverter(), Meal.pictureListSharedPrefKey);

  @override
  Future addMeal(Meal meal) async {
    var dto = converter.toDto(meal);
    await addDto(dto);
  }

  @override
  Future deleteMeal(Meal meal) async {
    var dto = converter.toDto(meal);
    await deleteDto(dto);
  }

  @override
  Future<List<Meal>> getAllMeals() async {
    var dto = await getAllDto();
    return Future.wait(
        dto.map((dto) => converter.fromDto(dto)).toList(growable: true));
  }

  @override
  Future<List<Meal>> getAllMealsByDate(DateTime date) async {
    var meals = await getAllMeals();
    return meals
        .where((element) => element.mealDate == date)
        .toList(growable: true);
  }

  @override
  Future updateMeal(Meal meal) async {
    var dto = converter.toDto(meal);
    await updateDto(dto);
  }
}
