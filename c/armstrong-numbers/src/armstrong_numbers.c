#include "armstrong_numbers.h"
#include <math.h>

int count_digits(int num)
{
    int digits = 0;
    while (num > 0)
    {
        ++digits;
        num /= 10;
    }
    return digits;
}

int integer_power(int base, int exponent) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
        result *= base;
    }
    return result;
}

bool is_armstrong_number(int num)
{
    int sum = 0;
    int res = num;
    int digits = count_digits(num);
    while (res > 0)
    {
        sum += (int) pow((double) (res % 10), digits);
        res /= 10;
    }
    return (sum == num);
}
