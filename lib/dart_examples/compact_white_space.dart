String compactWhiteSpace(String str) {
  return str.replaceAll(RegExp(r'\s{2,}'), " ");
}
