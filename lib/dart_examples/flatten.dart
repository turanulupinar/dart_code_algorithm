// karmaşık içiçe gelen listeleri tek bir liste haline getiren program

List<dynamic> flatten<T>(List<T> list) {
  return list
      .expand((element) => element is List ? flatten(element) : [element])
      .toList();
}
