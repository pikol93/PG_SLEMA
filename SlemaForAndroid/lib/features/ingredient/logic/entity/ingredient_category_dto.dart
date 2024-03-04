import 'package:pg_slema/utils/data/dto.dart';

class IngredientCategoryDto with Dto {
  @override
  final String id;
  final String name;
  final String? parentCategoryId;

  IngredientCategoryDto(this.id, this.name, {this.parentCategoryId});
}
