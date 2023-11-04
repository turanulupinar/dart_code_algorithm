// num listesinin ortalamasını alan algoritma

num average(List<num> list) {
  return list.reduce((num number1, num number2) => number1 + number2) /
      list.length;
}
