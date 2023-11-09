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
