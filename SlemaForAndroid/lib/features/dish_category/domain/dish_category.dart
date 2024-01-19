import 'package:pg_slema/features/dish/domain/dish.dart';

class DishCategory {
  static String dishCategoryListSharedPrefKey = "dishcategories";
  final String id;
  final String? parentCategoryId;
  List<DishCategory>? subcategories;
  List<Dish>? dishes;

  DishCategory(this.id,
      {this.parentCategoryId, this.subcategories, this.dishes});
}
