// Bir listede aynı itemdan birden fazla varsa bunları eleyip tek bir item haline
// getiren program. distinct= belirgin

List<T> distinct<T>(List<T> list) {
  return list.toSet().toList();
}
