import 'dart:math' as math;
// radyan ifade PI/2 = 90 derece. Bir radyan 6.xxxtir

num radsToDegrees(num rad) {
  return (rad * 180.0) / math.pi;
}
