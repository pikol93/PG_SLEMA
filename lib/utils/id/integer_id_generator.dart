import 'dart:math';

class IntegerIdGenerator {

  static const maxInt = -1 >>> 1;

  static int generateRandomId() {
    Random random = Random();
    return random.nextInt(maxInt);
  }

  static int generateRandomIdWhichIsNotForbidden(List<int> forbiddenIds) {
    Random random = Random();
    int randomId;
    do {
      randomId =  random.nextInt(maxInt);
    } while (forbiddenIds.contains(randomId));
    return randomId;
  }
}