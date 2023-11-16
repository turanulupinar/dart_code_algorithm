// iki ayrı listemizin aynı olup olmadığını kontrol eden program

bool haveSameContents<T>(List<T> list, List<T> list2) {
  for (T value in (list + list2).toSet()) {
    if (list.where((element) => element == value).length !=
        list2.where((element) => element == value).length) {
      return false;
    }
  }
  return true;
}
