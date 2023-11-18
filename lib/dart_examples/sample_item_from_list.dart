// bir listenin içinden bize rastgele bir veri dönderen program

import 'dart:math';

T sample<T>(List<T> list) {
  return list[Random().nextInt(list.length)];
}
