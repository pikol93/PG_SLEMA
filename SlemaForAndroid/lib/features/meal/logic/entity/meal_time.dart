enum MealTime { firstMeal, secondMeal, thirdMeal, fourthMeal, fifthMeal }

extension MealTimeExtension on MealTime {
  String get name {
    switch (this) {
      case MealTime.firstMeal:
        return 'Śniadanie';
      case MealTime.secondMeal:
        return 'Drugie śniadanie';
      case MealTime.thirdMeal:
        return 'Obiad';
      case MealTime.fourthMeal:
        return 'Podwieczorek';
      case MealTime.fifthMeal:
        return 'Kolacja';
    }
  }
}
