import 'package:pg_slema/features/meal/logic/converter/meal_dto_to_json_converter.dart';
import 'package:pg_slema/features/meal/logic/converter/meal_to_dto_converter.dart';
import 'package:pg_slema/features/meal/logic/entity/meal.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_dto.dart';
import 'package:pg_slema/features/meal/logic/repository/meal_repository.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';
import 'package:pg_slema/utils/date/date.dart';

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
  Future deleteMeal(String id) async {
    await deleteDto(id);
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
        .where((element) => element.mealDate.compareDates(date) == 0)
        .map((dto) => converter.fromDto(dto))
        .toList(growable: true));
  }

  @override
  Future updateMeal(Meal meal) async {
    var dto = converter.toDto(meal);
    await updateDto(dto);
  }

  @override
  Future addAllMealsFrom(List<Meal> meals) async {
    var dto = meals.map((e) => converter.toDto(e)).toList(growable: true);
    await addAllFrom(dto);
  }

  @override
  Future deleteMeals(List<String> idsToRemove) async {
    return deleteAllFrom(idsToRemove);
  }
}
