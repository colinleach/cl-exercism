class AllYourBase {
  static rebase(inputBase, digits, outputBase) {
 		if (inputBase < 2) {
			Fiber.abort("input base must be >= 2")
		}

 		if (outputBase < 2) {
			Fiber.abort("output base must be >= 2")
		}

		if (digits.count == 0) {
			return [0]
		}

    var sorted = digits[0..-1]
    sorted.sort()
		if (sorted[0] < 0 || sorted[-1] >= inputBase) {
			Fiber.abort("all digits must satisfy 0 <= d < input base")
		}

		return toDigits(fromDigits(digits, inputBase), outputBase)
 }

 	static fromDigits(digits, base) {
		var number = 0
		var multiplier = 1
		for (digit in digits[(digits.count - 1)..0]) {
			number = number + digit * multiplier
			multiplier = multiplier * base
		}
		return number
	}

	static toDigits(number, base) {
		if (number == 0) {
			return [0]
		}

		var result = []
		while (number > 0) {
			result.add(number % base)
			number = (number / base).floor
		}
		return result[(result.count - 1)..0]
	}

}

