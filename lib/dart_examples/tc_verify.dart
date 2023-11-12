import 'package:dart_code_algorithms/dart_examples/digitize.dart';

String tcVerify2(List<int> numbers) {
  var rest = (numbers.sublist(0, 10).reduce(
        (value, element) => value + element,
      )).toString();
  if (numbers.last.toString() == rest.split("").last) {
    return "Geçerli  ${numbers.last} = ${rest.split("").last}";
  } else {
    return "Geçersiz TC ${numbers.last} != ${rest.split("").last}";
  }
}

bool tcVerify(int numbers) {
  List<int> convertToNumbers = digitize(numbers);
  if (convertToNumbers.length != 11) {
    return false;
  }
  bool firstAndSecondNum = convertToNumbers.first == 0;
  if (firstAndSecondNum) {
    return false;
  }
  int rest = convertToNumbers
      .sublist(0, 10)
      .reduce((value, element) => value + element);

  if (convertToNumbers.last == int.parse(rest.toString().split("").last)) {
    return true;
  } else {
    return false;
  }
}
