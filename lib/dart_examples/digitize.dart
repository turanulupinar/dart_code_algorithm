//1234

List<int> digitize(int n) {
  return "$n".split('').map((e) => int.parse(e)).toList();
}
