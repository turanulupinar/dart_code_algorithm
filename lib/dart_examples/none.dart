// listede geçmeyen elemanları bulan program

bool none<T>(Iterable<T> itr, bool Function(T) fn) {
  return itr.any(fn);
}
