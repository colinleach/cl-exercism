#include "collatz_conjecture.h"

int steps(int n) {
    if (n <= 0) return ERROR_VALUE;

    int count = 0;
    while (n != 1) {
        (n % 2 == 0) ? (n /=2) : (n = 3*n + 1);
        count++;
    }
return count;
}