// Bir string ifadeyi maskeleyen program. 555...36=> ****36 nolu telefon gibi değerler veren program

String mask(String str, {int num = 4, String maskChar = "*"}) {
  return str.substring(str.length - num).padLeft(str.length, maskChar);
}
