// bir integer listedeki en büyük sayıyı bize dönderen program

import 'dart:math' as math;

int maxNumber(
  List<int> numbers,
) {
  return numbers.reduce(math.max);
}

int minNumber(
  List<int> numbers,
) {
  return numbers.reduce(math.min);
}
