// Bir cümlede \n lines ifadesi görünce bunu listeye çeviren program
// \n

List<String> splitLines(String str) {
  return str.split(RegExp(r'\r?\n'));
}
