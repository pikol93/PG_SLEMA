import 'package:pg_slema/features/meal/logic/entity/meal_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';
import 'package:pg_slema/utils/json/json_parser.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';

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
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }
    MealTime mealTime = _getMealTime(json['mealTime']);
    String mealDate = json['mealDate'] ?? DateTime.now().toString();
    var ingredientsIds = List<String>.from(json['ingredientsIds'] ?? []);
    return MealDto(json['id'], json['title'] ?? '', ingredientsIds,
        DateTime.parse(mealDate), mealTime);
  }

  Map<String, dynamic> _toJson(MealDto dto) => {
        'id': dto.id.toString(),
        'title': dto.title.toString(),
        'ingredientsIds': dto.ingredientsIds,
        'mealDate': dto.mealDate.toString(),
        'mealTime': JsonParser.parseEnumToJson(dto.mealTime),
      };

  MealTime _getMealTime(String? jsonKey) {
    MealTime mealTime = MealTime.firstMeal;
    try {
      mealTime = JsonParser.parseEnumFromJson(jsonKey, MealTime.values);
    } on ArgumentError {
      //Meal time is initialized before try catch clause
    }
    return mealTime;
  }
}
