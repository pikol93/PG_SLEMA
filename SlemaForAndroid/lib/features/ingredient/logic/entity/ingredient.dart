class Ingredient {
  static const String ingredientListSharedPrefKey = 'ingredients';
  final String id;
  final String name;
  final String categoryId;

  Ingredient(this.id, this.name, this.categoryId);
}
