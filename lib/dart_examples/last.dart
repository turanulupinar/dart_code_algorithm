// bir listenin son elemanı veren program

T? last<T>(List<T> list) {
  return list.isNotEmpty == true ? list[list.length - 1] : null;
}

T? first<T>(
  List<T> list,
) {
  return list.isNotEmpty == true ? list[0] : null;
}

T? firstByIndex<T>(List<T> list, {int index = 0}) {
  return list.length > index ? list[index] : null;
}
