module collatz_conjecture;

int steps(int n) {
     if (n <= 0) {
        throw new Exception("Invalid input");
    }
    auto count = 0;
    while (n > 1) {
        (n % 2 == 0) ? (n /=2) : (n = 3*n + 1);
        count++;
    }
    return count;
}

unittest
{
    import std.exception : assertThrown;

    const int allTestsEnabled = 0;

    // Zero steps for one
    assert(steps(1) == 0);

    // Divide if even
    assert(steps(16) == 4);

    // Even and odd steps
    assert(steps(12) == 9);

    // Large number of even and odd steps
    assert(steps(1000000) == 152);

    // Zero is an error
    assertThrown(steps(0));

    // Negative value is an error
    assertThrown(steps(-15));
}
