#include "armstrong_numbers.h"
#include <math.h>

double count_digits(int num)
{
    int digits = 0;
    while (num > 0)
    {
        ++digits;
        num /= 10;
    }
    return (double) digits;
}

bool is_armstrong_number(int num)
{
    int sum = 0;
    int res = num;
    double digits = count_digits(num);
    while (res > 0)
    {
        ++digits;
        sum += (int) pow((double) (res % 10), digits);
        res /= 10;
    }
    return (sum == num);
}