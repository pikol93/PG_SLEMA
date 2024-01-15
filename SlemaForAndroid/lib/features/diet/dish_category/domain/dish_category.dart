import 'package:pg_slema/features/diet/dish/domain/dish.dart';

class DishCategory {
  final String id;
  final String? parentCategoryId;
  final List<DishCategory>? subcategories;
  final List<Dish>? dishes;
  DishCategory(this.id,
      {this.parentCategoryId, this.subcategories, this.dishes});
}
