//1234
// int tipindeki numaraları listeye çevirir. !!!!!!!!!!ÖNEMLİ!!!!!!!!!!!!!

List<int> digitize(int n) {
  return "$n".split('').map((e) => int.parse(e)).toList();
}
