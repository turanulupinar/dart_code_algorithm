// verdiğimiz iteme göre liste dönderen program

List<T> everyNth<T>(List<T> list, int nth) {
  return List.generate(
      (list.length / nth).floor(), (index) => list[(index + 1) * nth - 1]);
}
