# Bird Watcher

Welcome to Bird Watcher on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

This is a big concept in R.
To help make sense of the possibilities, it can be useful to consider the dimensionality of the input and output of the various functions.

## Vector-in, scalar-out

We already saw functions that take in a vector and return a single, scalar-like value:

```R
> v <- 1:5
> length(v)
#> [1] 5
> sum(v)
#> [1] 15
```

Many statistical functions are also in this category, such as `mean()`.

For logical vectors, there are `all()` and `any()`.

## Vector-in, vector-out

Many functions in R will operate on entire vectors, often giving vector output.
This includes most of the mathematical functions:

```R
> sq <- c(4, 9, 16, 25)
> sqrt(sq) # square root
#> [1] 2 3 4 5
```

This is not just concise and convenient, avoiding the need for loops, list comprehensions or recursion, which are common in other languages.
In R, vector functions often run much faster than those techniques.

For sorting a vector, there is `sort()` to return the values and `order()` to return the indices:

```R
> v <- c("I", "am", "not", "in", "order")
> sort(v)
#> [1] "am"    "I"     "in"    "not"   "order"
> order(v)
#> [1] 2 1 4 3 5
```

The default is to sort in ascending order.
Specify `decreasing = TRUE` if necessary, or use `rev()` to reverse an existing vector.

```R
v <- c("I", "am", "not", "in", "order")
sort(v, decreasing = TRUE)
#> [1] "order" "not"   "in"    "I"     "am"

rev(1:4)
#> [1] 4 3 2 1
```
There are also functions to produce cumulative vector outputs, operating on the input vector left-to-right:

```R
> cumsum(1:5)
#> [1]  1  3  6 10 15  # sums
> cumprod(1:5)
#> [1]   1   2   6  24 120 # equivalent to factorials
```

## Multiple-vectors-in, vector-out

An extension of this concept can also be used to compare vectors.
For example, consider the pairwise-max function `pmax()`:

```R
> v
#> [1] 2 7 9
> w
#> [1] 3 1 5
> pmax(v, w)
#> [1] 3 7 9 # max of each pairwise comparison
```

## Instructions

You're an avid bird watcher that keeps track of how many birds have visited your garden in the last seven days.

You have six tasks, all dealing with the numbers of birds that visited your garden.

## 1. Check how many birds visited today

Implement the `today()` function to return how many birds visited your garden today. The bird counts are ordered by day, with the first element being the count of the oldest day, and the last element being today's count.

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
today(birds_per_day)
# => 1
```

## 2. Increment today's count

Implement the `increment_todays_count()` function to increment today's count:

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
increment_todays_count(birds_per_day)
# => c(2, 5, 0, 7, 4, 2)
```

## 3. Check if there was a day with no visiting birds

Implement the `has_day_without_birds()` function that returns `TRUE` if there was a day at which zero birds visited the garden; otherwise, return `FALSE`:

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
has_day_without_birds(birds_per_day)
# => true
```

## 4. Calculate the number of visiting birds for the first number of days

Implement the `count_for_first_days()` function that returns the number of birds that have visited your garden from the start of the week, but limit the count to the specified number of days from the start of the week.

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
count_for_first_days(birds_per_day, 4)
# => 14
```

## 5. Calculate the number of busy days

Some days are busier that others. A busy day is one where five or more birds have visited your garden.
Implement the `busy_days()` function to return the number of busy days:

```R
birds_per_day <- c(2, 5, 0, 7, 4, 1)
busy_days(birds_per_day)
# => 2
```

## 6. Calculate the running total of bird visits over the last week

You are curious how many birds in total have visited so far this week.
Calculate cumulative totals for each day.

```R
running_total(c(7, 6, 5, 4, 3, 2, 1))
#> [1]  7 13 18 22 25 27 28
```

## 7. Sort day names by how busy they are

You suspect that bird visits are affected by patterns of nearby road traffic, so different on weekends versus weekdays.

Sort the day abbreviations in _descending_ order of how many birds visited.

```R
day_names <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
birds_per_day <- c(5, 2, 4, 6, 0, 9, 8)
busy_days_of_week(birds_per_day, day_names)
#> [1] "Sat" "Sun" "Thu" "Mon" "Wed" "Tue" "Fri"
```

## Source

### Created by

- @colinleach