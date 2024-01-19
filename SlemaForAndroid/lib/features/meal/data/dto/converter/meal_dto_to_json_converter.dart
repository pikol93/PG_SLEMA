import 'package:pg_slema/features/meal/data/dto/meal_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';
import 'package:pg_slema/utils/json/json_parser.dart';
import 'package:pg_slema/utils/meal_time/meal_time.dart';

class MealDtoToJsonConverter
    with CustomConverter<MealDto, Map<String, dynamic>> {
  @override
  MealDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(MealDto t) {
    return _toJson(t);
  }

  MealDto _fromJson(Map<String, dynamic> json) {
    String mealTime = json.containsKey('mealTime')
        ? json['mealTime']
        : JsonParser.parseEnumToJson(MealTime.firstMeal);
    String mealDate = json.containsKey('mealDate')
        ? json['mealDate']
        : DateTime.now().toString();
    return MealDto(
        json['id'],
        json.containsKey('dishId') ? json['dishId'] : '',
        DateTime.parse(mealDate),
        JsonParser.parseEnumFromJson(mealTime, MealTime.values));
  }

  Map<String, dynamic> _toJson(MealDto dto) => {
        'id': dto.id.toString(),
        'dishId': dto.dishId.toString(),
        'mealDate': dto.mealDate.toString(),
        'mealTime': JsonParser.parseEnumToJson(dto.mealTime),
      };
}
