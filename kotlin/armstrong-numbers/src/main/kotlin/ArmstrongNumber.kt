import kotlin.math.pow

object ArmstrongNumber {

    private fun Int.toDigits(): List<Int> = toString().map { it.toString().toInt() }

    private fun Int.pow(n: Int): Int = toDouble().pow(n).toInt()

    private fun digitsToPow(digits: List<Int>, exponent: Int): List<Int> =
        digits.map { it.pow(exponent)}

    fun check(input: Int): Boolean {
        val digits = input.toDigits()
        val numDigits = digits.size
        return input == digitsToPow(digits, numDigits).sum()
    }

}
