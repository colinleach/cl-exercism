#include "perfect_numbers.h"

int aliquot_sum(int num) {
    int result = 0;
    for (int i = 1; i <= num / 2; i++) {
        if (num % i == 0) result += i;
    }
    return result;
}

kind classify_number(int num) {
    if (num <= 0) return ERROR;
    int asum = aliquot_sum(num);
    if (num == asum) return PERFECT_NUMBER;
    if (num < asum) return ABUNDANT_NUMBER;
    return DEFICIENT_NUMBER;
}
