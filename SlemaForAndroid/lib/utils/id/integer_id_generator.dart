import 'dart:math';

class IntegerIdGenerator {
  static const int maxInt = 1 << 31 - 1;

  static int generateRandomId() {
    Random random = Random();
    return random.nextInt(maxInt);
  }

  static List<int> generateRandomIds(int size) {
    return List<int>.generate(size, (index) => generateRandomId());
  }

  static List<int> generateRandomIdsWhichAreNotForbidden(
      List<int> forbiddenIds, int size) {
    List<int> ids = List<int>.empty(growable: true);
    while (size > 0) {
      int id = generateRandomIdWhichIsNotForbidden(forbiddenIds);
      if (!ids.contains(id)) {
        ids.add(id);
        size--;
      }
    }
    return ids;
  }

  static int generateRandomIdWhichIsNotForbidden(List<int> forbiddenIds) {
    Random random = Random();
    int randomId;
    do {
      randomId = random.nextInt(maxInt);
    } while (forbiddenIds.contains(randomId));
    return randomId;
  }
}
