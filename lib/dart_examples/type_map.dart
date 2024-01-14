// - List<String> sports = ['kriket', 'futbol', 'tenis', 'beyzbol']; Bu listeyi map tipine dönüştürün.  +

listToMap(List lst) {
  return lst.map((e) => e);
}

// - var mixList = [1, "a", 2, "b", 3, "c", 4, "d"]; Bu listedeki int değerleri yada    ++
// string değerleri alıp çıktı olarak veren bir fonksiyon yazınız.,

intOutput(List mixLst, Type type) {
  var output = [];
  for (var i = 0; i < mixLst.length; i++) {
    if (mixLst[i].runtimeType == type) {
      output.add(mixLst[i]);
    }
  }
  return output;
}

// - List<String> sports = ['kriket', 'futbol', 'tenis', 'beyzbol']; bu listeye yeni
//bir spor adı ekleyin. Eğer aynı spor adı içeriyorsa ekleme yapmayarak “zaten eklenmiş” uyarısı vermesini sağlayın

List<String> listAddData(List<String> lst, String str) {
  for (var i = 0; i < lst.length; i++) {
    if (lst.contains(str) == true) {
      return lst;
    }
  }
  lst.add(str);
  return lst;
}

// - Verilen bir karenin alanını hesaplayan ve bunu double olarak dönderen bir fonksiyon yazınız.  ++ ??

// ekleme ( eğer bu çıkan sonuç ondalık değerler yoksa noktadan sonrasını alma varsa al)

double squareExtent(double sE) {
  var multiplication = sE * sE;
  if (multiplication.runtimeType == int) {
    return multiplication;
  } else {
    return multiplication;
  }
}

// bir halı yıkama şirketi var halı yıkama şirketinde en boy ve yüz ölçümüne göre fiyatlandırma yapıalcaktır.



