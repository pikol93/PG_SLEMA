import 'package:pg_slema/utils/data/dto.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

class MealDto with Dto {
  @override
  final String id;
  final Set<String> dishesIds;
  final DateTime mealDate;
  final MealTime mealTime;

  MealDto(this.id, this.dishesIds, this.mealDate, this.mealTime);
}
