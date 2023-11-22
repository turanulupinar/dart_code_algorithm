// bir cümleyi bize kelimelere ayırıp liste halinde veren dart programı.(Özel karakterleri almayan bir patterne göre)

List<String> words(String str, {String pattern = '[^a-zA-Z0-9ığüşöçİĞÜŞÖÇ]+'}) {
  return str
      .split(RegExp(pattern))
      .where((element) => element.isNotEmpty)
      .toList();
}
