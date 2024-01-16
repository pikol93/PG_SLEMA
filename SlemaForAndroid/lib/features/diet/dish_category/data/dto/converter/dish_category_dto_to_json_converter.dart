import 'package:pg_slema/features/diet/dish_category/data/dto/dish_category_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';

class DishCategoryDtoToJsonConverter
    with CustomConverter<DishCategoryDto, Map<String, dynamic>> {
  @override
  DishCategoryDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(DishCategoryDto t) {
    return _toJson(t);
  }

  DishCategoryDto _fromJson(Map<String, dynamic> json) {
    return DishCategoryDto(json['id'],
        parentCategoryId: json.containsKey('parentCategoryId')
            ? json['parentCategoryId']
            : null);
  }

  Map<String, dynamic> _toJson(DishCategoryDto dto) => {
        'id': dto.id.toString(),
        'parentCategoryId': dto.parentCategoryId?.toString(),
      };
}
