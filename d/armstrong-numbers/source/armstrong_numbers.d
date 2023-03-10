module armstrong_numbers;

bool isArmstrongNumber(int num) {
    int[] digits;
    size_t i = 0;
    int n = num;
    int sum = 0;
    while (n > 0) {
        digits ~= n% 10;
        i++;
        n /= 10;
    }
    foreach(d; digits) {
        sum += d^^i;
    }
    return sum == num;
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Zero is an Armstrong number
    assert(isArmstrongNumber(0));

    // Single digit numbers are Armstrong numbers
    assert(isArmstrongNumber(5));

    // There are no 2 digit Armstrong numbers
    assert(!isArmstrongNumber(10));

    // Three digit number that is an Armstrong number
    assert(isArmstrongNumber(153));

    // Three digit number that is not an Armstrong number
    assert(!isArmstrongNumber(100));

    // Four digit number that is an Armstrong number
    assert(isArmstrongNumber(9474));

    // Four digit number that is not an Armstrong number
    assert(!isArmstrongNumber(9475));

    // Seven digit number that is an Armstrong number
    assert(isArmstrongNumber(9926315));

    // Seven digit number that is not an Armstrong number
    assert(!isArmstrongNumber(9926314));
}
