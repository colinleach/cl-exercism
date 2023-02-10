pub const ComputationError = error {IllegalArgument};

pub fn steps(number: isize) anyerror!usize {
    if (number < 1) {
        return ComputationError.IllegalArgument;
    } else {
        var stepCount: usize = 0;
        var n: isize = number;
        while (n > 1) {
            n = if (@rem(n, 2) == 0) @divTrunc(n, 2) else (3 * n + 1);
            stepCount += 1;
        }
        return stepCount;
    }
}
