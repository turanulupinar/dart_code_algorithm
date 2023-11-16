List<T> initial<T>(List<T> list) {
  return list.length > 1 ? list.sublist(0, list.length - 1) : list;
}
