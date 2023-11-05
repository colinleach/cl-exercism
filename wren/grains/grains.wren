class Grains {
  static square(num) {
    if (num < 1 || num > 64) Fiber.abort("square must be between 1 and 64")

    return 2.pow(num - 1)
  }

  static total {
    return 2.pow(64) - 1
  }
}
