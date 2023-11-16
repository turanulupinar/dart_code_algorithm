List<T> dropItem<T>(List<T> list, {int n = 0}) {
  return list.sublist(n);
}

List<T> dropRight<T>(List<T> list, {int n = 1}) {
  return list.sublist(0, list.length - n);
}

List<T> dropRightWhile<T>(List<T> list, bool Function(T) test) {
  int rightIndex = list.lastIndexWhere(test);
  return rightIndex == -1 ? [] : list.sublist(0, rightIndex + 1);
}
