
// bir liste içinde verdiğimiz koşula göre değerin sağlanıp sağlanmadığını dönderen program

bool some<T>(Iterable<T> itr, bool Function(T) fn) {
  return itr.any(fn);
}
