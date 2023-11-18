// Bir listede en çok geçen itemı bulan program

mostFrequent<T>(Iterable<T> itr) {
  return itr.toSet().reduce((i, j) =>
      itr.where((v) => v == i).length > itr.where((v) => v == j).length
          ? i
          : j);
}
