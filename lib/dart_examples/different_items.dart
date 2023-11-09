List<T> findDifferenceItem<T>(Iterable<T> a, Iterable<T> b) {
  final s = b.toSet();
  return a.where((val) => !s.contains(val)).toList();
}



 
