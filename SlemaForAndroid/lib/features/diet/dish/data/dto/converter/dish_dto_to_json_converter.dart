import 'package:pg_slema/features/diet/dish/data/dto/dish_dto.dart';
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
    return DishDto(json['id'], json.containsKey('name') ? json['name'] : '',
        json.containsKey('categoryId') ? json['categoryId'] : '');
  }

  Map<String, dynamic> _toJson(DishDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        'categoryId': dto.categoryId.toString(),
      };
}
