// Bu program bir listenin içerisinde birden fazla elemanın var olup olmadığına bakar.
// Eğer herhangi biri var ise true dönderir.

bool isIncludeAny<T>(Iterable<T> itr, Iterable<T> values) {
  return values.any((element) => itr.contains(element));
}
