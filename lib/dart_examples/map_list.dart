Map<dynamic, R> mapList<T, R>(Iterable<T> itr, R Function(T) fn,
    {String keyName = ""}) {
  // ignore: prefer_for_elements_to_map_fromiterable
  return Map.fromIterable(itr,
      key: (key) => "$keyName$key", value: (val) => fn(val));
}
