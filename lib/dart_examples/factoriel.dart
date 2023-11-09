// Recursive function

int factorial(int n) {
  if (n < 0) return 0;
  return n <= 1 ? 1 : n * factorial(n - 1);
}


// for yada while vs kullanmadan 1'den 10'a say