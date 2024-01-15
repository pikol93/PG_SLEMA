import 'package:pg_slema/utils/data/dto.dart';

class DishDto with Dto {
  @override
  final String id;
  final String name;
  final String categoryId;

  DishDto(this.id, this.name, this.categoryId);

  @override
  set id(String id) {
    this.id = id;
  }
}
