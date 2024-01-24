import 'package:pg_slema/features/meal/data/dto/converter/meal_dto_to_json_converter.dart';
import 'package:pg_slema/features/meal/data/dto/meal_dto.dart';
import 'package:pg_slema/features/meal/data/repository/meal_repository.dart';
import 'package:pg_slema/features/meal/domain/converter/meal_to_dto_converter.dart';
import 'package:pg_slema/features/meal/domain/meal.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesMealRepository
    extends SharedPreferencesCrudRepository<MealDto> with MealRepository {
  final MealToDtoConverter converter;

  SharedPreferencesMealRepository(this.converter)
      : super(MealDtoToJsonConverter(), Meal.mealListSharedPrefKey);

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
    var dto = await getAllDto();
    return Future.wait(dto
        .where((element) => element.mealDate == date)
        .map((dto) => converter.fromDto(dto))
        .toList(growable: true));
  }

  @override
  Future updateMeal(Meal meal) async {
    var dto = converter.toDto(meal);
    await updateDto(dto);
  }

  @override
  Future addMealsFrom(List<Meal> meals) async {
    var dto = meals.map((e) => converter.toDto(e)).toList(growable: true);
    await addAllFrom(dto);
  }
}
