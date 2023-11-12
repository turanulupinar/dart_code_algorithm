//unique = eşsiz, benzersiz

// Bir liste içerisinde aynı veya eşi olmayan itemları bulan program

// list =[1,2,2,3,4,4,5];

List<T> filterUniqueItem<T>(List<T> list) {
  return list
      .where((element) => list.indexOf(element) == list.lastIndexOf(element))
      .toList();
}

List<T> filterNonUniqueItem<T>(List<T> list) {
  return list
      .where((element) => list.indexOf(element) != list.lastIndexOf(element))
      .toList();
}
