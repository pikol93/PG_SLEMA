import 'package:pg_slema/utils/data/dto.dart';

class IngredientDto with Dto {
  @override
  final String id;
  final String name;
  final String categoryId;

  IngredientDto(this.id, this.name, this.categoryId);
}
