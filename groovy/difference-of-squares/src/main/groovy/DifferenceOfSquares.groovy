class DifferenceOfSquares {
    Integer num

    DifferenceOfSquares(num) {
        this.num = num
    }

    def squareOfSum() {
        int sum_to_n = num * (num + 1) / 2
        sum_to_n ** 2
    }

    def sumOfSquares() {
        num * (num + 1) * (2 * num + 1) / 6
    }

    def difference() {
        squareOfSum() - sumOfSquares()
    }

}
