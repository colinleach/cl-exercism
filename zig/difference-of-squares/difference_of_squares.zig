pub fn squareOfSum(n: isize) isize {
    const sumN = @divTrunc(n * (n + 1), 2);
    return sumN * sumN;
}

pub fn sumOfSquares(n: isize) isize {
    return @divTrunc(n * (n+1) * (2*n + 1), 6);
}

pub fn differenceOfSquares(number: isize) isize {
    return squareOfSum(number) - sumOfSquares(number);
}
