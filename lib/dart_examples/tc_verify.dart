import 'package:dart_code_algorithms/dart_examples/digitize.dart';

String tcVerify(numbers) {
  var rest = (numbers.sublist(0, 10).reduce(
        (value, element) => value + element,
      )).toString();
  if (numbers.last.toString() == rest.split("").last) {
    return "Geçerli  ${numbers.last} = ${rest.split("").last}";
  } else {
    return "Geçersiz TC ${numbers.last} != ${rest.split("").last}";
  }
}

// TODO t kimlik verify tamamlanaak

String tcVerfyAlternative(numbers) {
  var convertToNumbers = digitize(numbers);
  // var forIndexOfIsOdd = [];
  // var forIndexOfIsEven = [];

  var firstAndSecondNum = convertToNumbers.sublist(0, 1);
  var rest = convertToNumbers
      .sublist(0, 10)
      .reduce((value, element) => value + element)
      .toString();
  if (convertToNumbers.last.toString() == rest.split("").last) {
    if (convertToNumbers.length == 11) {
      if (firstAndSecondNum.contains(0) != true) {
        var lastDigit = digitize(numbers).last;
        if ((int.parse(rest) % 10) == lastDigit) {
          return "Tc kimlik doğrulamanız yapılmıştır. $numbers";
        }
      }
    }
  }
  return "tekrar deneyiniz";
}
