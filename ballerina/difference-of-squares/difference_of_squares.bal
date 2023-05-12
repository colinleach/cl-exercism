public function squareOfSum(int n) returns int {
    int sum_n = n * (n + 1) / 2;
    return sum_n * sum_n;
}

public function sumOfSquares(int n) returns int {
    return n * (n + 1) * (2 * n + 1) / 6;
}

public function differenceOfSquares(int n) returns int {
    return squareOfSum(n) - sumOfSquares(n);
}
