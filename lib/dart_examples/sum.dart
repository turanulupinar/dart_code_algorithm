int sumNumbers(List<int> nums) {
  return nums.reduce((value, element) => element + value);
}

int sumNumbersBy<T>(List<T> list, int Function(T) fn) {
  return list.map(fn).reduce((value, element) => value + element);
}
