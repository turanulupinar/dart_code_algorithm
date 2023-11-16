// iki liste arasından kesişen itemları bulan program

List<T> intersection<T>(Iterable<T> a, Iterable<T> b) {
  final list1 = b.toSet();
  return a.toSet().where((element) => list1.contains(element)).toList();
}
