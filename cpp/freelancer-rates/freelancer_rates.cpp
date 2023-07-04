// INFO: Headers from the standard library should be inserted at the top via
#include <cmath>

// daily_rate calculates the daily rate given an hourly rate
double daily_rate(double hourly_rate) {
    double hours_in_day = 8.0;
    return hourly_rate * hours_in_day;
}

// apply_discount calculates the price after a discount
double apply_discount(double before_discount, double discount) {
    return before_discount * (1 - discount / 100.0);
}

double daily_after_discount(double hourly_rate, double discount) {
    double daily_before_discount = daily_rate(hourly_rate);
    return  apply_discount(daily_before_discount, discount);
}

// monthly_rate calculates the monthly rate, given an hourly rate and a discount
// The returned monthly rate is rounded up to the nearest integer.
int monthly_rate(double hourly_rate, double discount) {
    int days_in_month = 22;
    return ceil(days_in_month * daily_after_discount(hourly_rate, discount));
}

// days_in_budget calculates the number of workdays given a budget, hourly rate,
// and discount The returned number of days is rounded down (take the floor) to
// the next integer.
int days_in_budget(int budget, double hourly_rate, double discount) {
    return floor(budget / daily_after_discount(hourly_rate, discount));
}