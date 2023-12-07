String compactWhiteSpace(String str) {
  return str.replaceAll(RegExp(r'\s{2,}'), " ");
}

List<String>? takeOneStringType(
  List list,
) {
  final List<String> list2 = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i] is String) {


    
      (list[i] as String).split("");
      list2.add(list[i]);
    }
  }
  return list2;
}

List<T>? takeOneType<T>(
  List list,
) {
  final List<T> list2 = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i] is T) {
      list2.add(list[i]);
    }
  }
  return list2;
}

 
// Dart type Safety bir dildir
// Dart sadece tiplerin uyuşması ile ilgilenir