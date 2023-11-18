// Bir listenin içerisinde birden fazla elemanın geçtiğini bulan program

bool isIncludeAll<T>(Iterable<T> itr, Iterable<T> values) {
  return values.every((element) => itr.contains(element));
}
