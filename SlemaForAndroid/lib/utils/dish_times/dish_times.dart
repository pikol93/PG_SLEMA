enum MealTime { breakfast, lunch, snackTime, dinner, supper }

extension DishTimeExtension on MealTime {
  String get name {
    switch (this) {
      case MealTime.breakfast:
        return 'Śniadanie';
      case MealTime.lunch:
        return 'Drugie śniadanie';
      case MealTime.snackTime:
        return 'Obiad';
      case MealTime.dinner:
        return 'Podwieczorek';
      case MealTime.supper:
        return 'Kolacja';
    }
  }
}
