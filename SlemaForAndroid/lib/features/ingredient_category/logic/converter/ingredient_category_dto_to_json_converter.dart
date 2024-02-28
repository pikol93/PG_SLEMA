import 'package:pg_slema/features/ingredient_category/logic/entity/ingredient_category_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';

class IngredientCategoryDtoToJsonConverter
    with CustomConverter<IngredientCategoryDto, Map<String, dynamic>> {
  @override
  IngredientCategoryDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(IngredientCategoryDto t) {
    return _toJson(t);
  }

  IngredientCategoryDto _fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    return IngredientCategoryDto(json['id'], json['name'] ?? "",
        parentCategoryId: json['parentCategoryId']);
  }

  Map<String, dynamic> _toJson(IngredientCategoryDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        if (dto.parentCategoryId != null)
          'parentCategoryId': dto.parentCategoryId.toString(),
      };
}
