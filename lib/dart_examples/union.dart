// iki adet listeyi eleman tekrar olamayacak şekilde birleştiren program

List<T> union<T>(Iterable<T> list, Iterable<T> list2) {
  return (list.toList() + list2.toList()).toSet().toList();
}

List<R> unionBy<T, R>(Iterable<T> list, Iterable<T> list2, R Function(T) fn) {
  final List<R> sA = list.map(fn).toSet().toList();
  final List<R> sB =
      list2.map(fn).where((element) => !sA.contains(element)).toList();
  return sA + sB;
}
