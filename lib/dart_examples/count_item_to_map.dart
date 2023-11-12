// bir listede birden fazla element varsa, bu elemenler kaçtane olduğunu map olarak veren program

Map<T, int> countItemToMap<T>(Iterable<T> itr) {
  return Map.fromIterable(itr.toSet(),
      value: (element) => itr.where((val) => val == element).length);
}
