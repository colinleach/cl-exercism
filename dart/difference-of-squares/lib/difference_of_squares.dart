class DifferenceOfSquares {
  int squareOfSum(int n) {
    int sumN = n * (n + 1) ~/ 2;
    return sumN * sumN;
  }
  int sumOfSquares(int n) => n * (n+1) * (2*n + 1) ~/ 6;
  int differenceOfSquares(int n) => squareOfSum(n) - sumOfSquares(n);
}
