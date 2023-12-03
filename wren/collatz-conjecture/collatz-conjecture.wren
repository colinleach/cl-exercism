class Collatz {
  static steps(n) {
    if (n < 1) Fiber.abort("Only positive numbers are allowed")

    var steps = 0
    while (n > 1) {
      n = (n % 2 == 0) ? n / 2 : 3 * n + 1
      steps = steps + 1
    }
    return steps
  }
}
