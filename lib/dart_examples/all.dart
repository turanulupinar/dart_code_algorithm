// Bir listenin içindeki elemanların hepsi, verilen fonksiyon parametresinin içerisindeki
// Koşula uygun ise true yada false dönderen function

bool all<T>(Iterable<T> itr, bool Function(T) fn) {
  return itr.every(fn);
}
