import 'dart:math';

int randomIntInRange({int minimum = 0, int maximum = 100}) {
  return (Random().nextDouble() * (maximum - minimum + 1) + minimum).ceil();

  //  return (Random().nextDouble() * (maximum - minimum + 1) + minimum).floor();
}
