// Bir stringin belli bir kısmını kesip diğer kısmını almamak için

String truncateString(String str, int number) {
  return str.length > number
      ? "${str.substring(0, number > 3 ? number - 3 : number)}..."
      : str;
}
