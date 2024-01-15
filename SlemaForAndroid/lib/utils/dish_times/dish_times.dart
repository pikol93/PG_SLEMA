enum DishTime { breakfast, lunch, snackTime, dinner, supper }

extension DishTimeExtension on DishTime {
  String get name {
    switch (this) {
      case DishTime.breakfast:
        return 'Śniadanie';
      case DishTime.lunch:
        return 'Drugie śniadanie';
      case DishTime.snackTime:
        return 'Obiad';
      case DishTime.dinner:
        return 'Podwieczorek';
      case DishTime.supper:
        return 'Kolacja';
    }
  }
}
