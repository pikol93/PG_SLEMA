import 'package:pg_slema/features/ingredient/logic/entity/ingredient_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';

class IngredientDtoToJsonConverter
    with CustomConverter<IngredientDto, Map<String, dynamic>> {
  @override
  IngredientDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(IngredientDto t) {
    return _toJson(t);
  }

  IngredientDto _fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    return IngredientDto(
        json['id'], json['name'] ?? '', json['categoryId'] ?? '');
  }

  Map<String, dynamic> _toJson(IngredientDto dto) => {
        'id': dto.id.toString(),
        'name': dto.name.toString(),
        'categoryId': dto.categoryId.toString(),
      };
}
