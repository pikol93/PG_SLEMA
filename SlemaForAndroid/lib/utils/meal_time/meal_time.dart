enum MealTime { firstMeal, secondMeal, thirdMeal, fourthMeal, fifthMeal }

extension MealTimeExtension on MealTime {
  String get name {
    switch (this) {
      case MealTime.firstMeal:
        return 'Śniadanie';
      case MealTime.secondMeal:
        return 'Drugie śniadanie';
      case MealTime.fourthMeal:
        return 'Obiad';
      case MealTime.thirdMeal:
        return 'Podwieczorek';
      case MealTime.fifthMeal:
        return 'Kolacja';
    }
  }
}
