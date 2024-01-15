enum MealTime { breakfast, lunch, snackTime, dinner, supper }

extension MealTimeExtension on MealTime {
  String get name {
    switch (this) {
      case MealTime.breakfast:
        return 'Śniadanie';
      case MealTime.lunch:
        return 'Drugie śniadanie';
      case MealTime.dinner:
        return 'Obiad';
      case MealTime.snackTime:
        return 'Podwieczorek';
      case MealTime.supper:
        return 'Kolacja';
    }
  }
}
