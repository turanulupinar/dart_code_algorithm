// Bir kelimenin ilk harfiniz otomatik olarak büyük
// yapan ve isteğe baplı olarak başka büyük harfler varsa onlarıda küçük yapan function

String capitalize(String str, {bool lowerCase = false}) {
  String str2 = str.split(" ").first;
  String res = str2[0].toUpperCase() +
      (lowerCase ? str2.substring(1).toLowerCase() : str2.substring(1));
  return str.split(" ").length > 1 ? "$res ${str.split(" ").last}" : str2;
}
