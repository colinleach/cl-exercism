object CollatzCalculator {
    fun computeStepCount(start: Int): Int {
        if (start < 1) throw IllegalArgumentException()

        var count = 0
        var n = start
        while (n != 1) {
            n = if (n % 2 == 0) n / 2 else 3 * n + 1
            count++
        }
        return count
    }
}
