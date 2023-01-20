class Squares(private val n: Int) {

    fun sumOfSquares(): Int = n * (n+1) * (2*n + 1) / 6

    fun squareOfSum(): Int {
        val intermediate = n * (n + 1) / 2
        return intermediate * intermediate
    }

    fun difference(): Int = squareOfSum() - sumOfSquares()
}
