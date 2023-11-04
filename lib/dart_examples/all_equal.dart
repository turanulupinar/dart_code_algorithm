// Bir listenin tüm elemanlarını birbirine eşit mi onu kontrol eden function

bool allEqual<T>(List<T> list) {
  return list.every((element) => element == list.first);
}
