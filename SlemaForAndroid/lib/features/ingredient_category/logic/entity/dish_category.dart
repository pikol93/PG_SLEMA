import 'package:pg_slema/features/ingredient/logic/entity/ingredient.dart';

class DishCategory {
  static String dishCategoryListSharedPrefKey = "dishcategories";
  final String id;
  final String name;
  final String? parentCategoryId;
  List<DishCategory>? subcategories;
  List<Ingredient>? dishes;

  DishCategory(this.id, this.name,
      {this.parentCategoryId, this.subcategories, this.dishes});
}
