class Squares {
  static squareOfSum(n) {
    var sum = n * (n + 1) / 2
    return sum * sum
  }
  
  static sumOfSquares(n) {
    return n * (n + 1) * (2 * n + 1) / 6
  }

  static differenceOfSquares(n) {
    return squareOfSum(n) - sumOfSquares(n)
  }
}
