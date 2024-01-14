// SORULAR

// - Bir liste verildiğinde, liste elemanlarının karesini içeren yeni bir liste oluşturan bir Dart fonksiyonu yazın. +

Iterable<int> squaredList(List<int> lst) {
  List<int> squared = [];
  for (var i = 0; i < lst.length; i++) {
    if (lst.isEmpty == false) {
      squared.add(lst[i] * lst[i]);
    }
  }
  return squared;
}

// - İki farklı liste verildiğinde, karşılıklı elemanları toplayarak yeni bir liste oluşturan bir Dart fonksiyonu yazın. +

List<int> reciprocalList(List list1, List list2) {
  List<int> totalList = [];
  if (list1.length == list2.length) {
    for (var i = 0; i < list1.length; i++) {
      var veriable = list1[i] + list2[i];
      totalList.add(veriable);
    }
  }

  return totalList;
}

// - Bir metin dizisi verildiğinde, her kelimenin uzunluğunu içeren bir liste döndüren  Dart fonksiyonu yazın. +

List<int> wordLenghtList(List<String> lst) {
  List<int> lenghtNo = [];
  for (var i = 0; i < lst.length; i++) {
    lenghtNo.add(lst[i].length);
  }
  return lenghtNo;
}

// -  Bir liste verildiğinde, listedeki çift sayıları filtreleyerek yeni bir liste oluşturan bir Dart fonksiyonu yazın.  +
Iterable<int> evenNumbersList(List<int> lst) {
  List<int> evenNumbers = [];
  for (var i = 0; i < lst.length; i++) {
    if (lst[i].isEven == true) {
      evenNumbers.add(lst[i]);
    }
  }
  return evenNumbers;
}

// -  İki boyutlu bir liste verildiğinde, her bir satırdaki en büyük elemanı bulan ve bu elemanları  ----
//içeren bir liste döndüren bir Dart fonksiyonu yazın.


