import 'package:pg_slema/features/dish_category/logic/entity/dish_category_dto.dart';
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
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    return DishCategoryDto(json['id'], json['name'] ?? "",
        parentCategoryId: json['parentCategoryId']);
  }

  Map<String, dynamic> _toJson(DishCategoryDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        if (dto.parentCategoryId != null)
          'parentCategoryId': dto.parentCategoryId.toString(),
      };
}