class Dish {
  static const String dishListSharedPrefKey = 'dishes';
  final String id;
  final String name;
  final String categoryId;

  Dish(this.id, this.name, this.categoryId);
}
