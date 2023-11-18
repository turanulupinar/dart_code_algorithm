// bir sayı listesinden rastgele sayıları bize veren program

import 'dart:math';

List<int> randomListIntInRange(int number,
    {int maximum = 100, int minimum = 0}) {
  return List<int>.generate(number,
      (_) => (Random().nextDouble() * (maximum - minimum + 1) + 1).floor());
}
