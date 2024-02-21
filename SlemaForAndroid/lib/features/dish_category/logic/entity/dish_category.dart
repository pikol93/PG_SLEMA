import 'package:pg_slema/features/dish/logic/entity/dish.dart';

class DishCategory {
  static String dishCategoryListSharedPrefKey = "dishcategories";
  final String id;
  final String name;
  final String? parentCategoryId;
  List<DishCategory>? subcategories;
  List<Dish>? dishes;

  DishCategory(this.id, this.name,
      {this.parentCategoryId, this.subcategories, this.dishes});
}
