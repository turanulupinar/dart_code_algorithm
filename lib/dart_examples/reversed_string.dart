// bir stringi ters çeviren program

String reverseString(String str) {
  return str.split("").reversed.join("");
}

String reverseDate(String str,{String splittedChar="-"}) {
  return str.split(splittedChar).reversed.join(splittedChar);
}
