// iki liste arasında symetric olmayan itemları bulan program
// [1,2,3] [1,3,2]   [2,3]

List<T> symetricDifference<T>(List<T> list, List<T> list2) {
  final sym = list.toSet(), sym2 = list2.toSet();
  return list.where((element) => !sym2.contains(element)).toList()
    ..addAll(list2.where((element) => !sym.contains(element)));
}
