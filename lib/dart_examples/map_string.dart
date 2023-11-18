String mapString(String str, String Function(String c) fn) {
  return str.split("").map(fn).join("");
}

//   String   -     Function        (String c)   -           fn
//  dönüş tipi  -   tip      -dönderilen parametre  -   fonksiyonun adı

// String Function(String c) fn neden böyle bir fonksiyon yazma ihtiyacı duydum?

// Ben string bir değer elde etmek istediğim için bir fonksiyonun dönüş tipine String değeri verdim
// Function tipini ise ben bir değeri işleyip yeni birşey üretmek yada hesaplamak için kullandım
// String c parametresi ise bu fn adındaki fonksiyonun bir String tipinde veriyi bana dönderdiğini ifade ediyor.
// Peki buna neden ihtiyac duydum? Çünkü bu fonksiyonun ona verdiğim değeri işledikten sonra anında bana işlediği veriyi
// döndermesini istedim. Böyle bu fonksiyonu nerede kullanırsam işlediği değerede oradan direk ulaşabilirim.

String printLog(String str) {
  return "Konsola yazınlan değer: $str";
}

looger(String Function(String str) printLog) {}
