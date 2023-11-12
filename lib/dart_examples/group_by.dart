// bir listeki elemanların uzunluğunu map tipinde veren program

Map<Y, List<T>> groupBy<T, Y>(Iterable<T> itr, Y Function(T) fn) {
  return Map.fromIterable(itr.map((fn)).toSet(),
      value: (i) => itr.where((element) => fn(element) == i).toList());
}
