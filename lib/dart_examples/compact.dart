List<T> compact<T>(List<T> list, {dynamic param}) {
  return list..removeWhere((element) => [null, " ", param].contains(element));
}
