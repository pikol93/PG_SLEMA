import 'package:pg_slema/utils/data/dto.dart';

class DishCategoryDto with Dto {
  @override
  final String id;
  final String name;
  final String? parentCategoryId;

  DishCategoryDto(this.id, this.name, {this.parentCategoryId});
}
