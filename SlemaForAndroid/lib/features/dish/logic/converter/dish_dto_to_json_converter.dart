import 'package:pg_slema/features/dish/logic/entity/dish_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';

class DishDtoToJsonConverter
    with CustomConverter<DishDto, Map<String, dynamic>> {
  @override
  DishDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(DishDto t) {
    return _toJson(t);
  }

  DishDto _fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    return DishDto(json['id'], json['name'] ?? '', json['categoryId'] ?? '');
  }

  Map<String, dynamic> _toJson(DishDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        'categoryId': dto.categoryId.toString(),
      };
}
