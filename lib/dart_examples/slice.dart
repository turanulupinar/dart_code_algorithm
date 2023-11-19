// Bir listenin belli bir kısmını kesen program

List slice<T>({required List<T> list, required int startIndex, int? endIndex}) {
  try {
    int start = startIndex.isNegative ? list.length + startIndex : startIndex;
    int end = endIndex != null && endIndex != 0
        ? endIndex.isNegative
            ? list.length + endIndex
            : endIndex
        : list.length;

    return list.sublist(start, end);
  } catch (e) {
    return ["Aralığı olmayan bir değer girildi"];
  }
}
