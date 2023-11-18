// iki double değer arasından random sayı elde eden program

import 'dart:math' as math;

double randomDoubleInRange({double mininum = 0.0, double maximum = 1.0}) {
  return math.Random().nextDouble() * (maximum - mininum + 1) + mininum;
}
