String decapitalize(String str, {bool upper = false}) {
  return str[0].toUpperCase() +
      (upper ? str.substring(1).toLowerCase() : str.substring(1));
}
