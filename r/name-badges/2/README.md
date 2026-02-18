# Name Badges

Welcome to Name Badges on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Many languages have a way such as `null` or `none` to indicate a non-existent value.
Because R is designed to handle large volumes of (often messy) data, it has multiple forms of nothingness.

The overall aim is to flag missing or suspect values as they are encountered, then continue without raising an exception.

## NULL

If a value really doesn't exist, it is repesented by `NULL`. This is probably closest to what C or Python might do.

```R
v <- c() # zero-length vector
v
#> NULL
is.null(v)
#> [1] TRUE
```

In many contexts, `NULL` values are simply ignored:

```R
c(2, 3, NULL, 5)
#> [1] 2 3 5
```

## NA

For situations where a value exists but we don't know what it is, `NA` is used. For example, when counting vehicles traveling on a road, human observers might go off sick or automatic sensors break down, but the traffic continues to flow.

```R
v <- c(1, 2, NA, 4, 5)
v
#> [1]  1  2 NA 4  5
is.na(v) # test for data gaps
#> [1] FALSE FALSE  TRUE FALSE FALSE
```

Thus `NA` is a placeholder, warning humans that they need to make a decision about how to handle this.

## Empty vectors

Perhaps surprisingly, R has no standard way to check for emptiness, though some third-party packages implement their own functions such as `is.empty()`.

Even generating an empty vector is not entirely obvious.
We saw in an earlier section that `c()` with no arguments returns `NULL`, not a vector.

```R
is.vector(c())
#> [1] FALSE
```

Functions such as `logical()` or `integer()` take an argument specifying the desired length, which can be zero.

```R
z <- logical(0)
is.vector(z)
#> [1] TRUE
length(z)
#> [1] 0
```

We can also generate a vector then remove every element, as described in the [Vectors Concept][concept-vectors].
This results in a length-0 vector of an appropriate type.

```R
v <- 5
v[-1]  # delete the first element
#> numeric(0)
```

[concept-vectors]: https://exercism.org/tracks/r/concepts/vectors

## Instructions

In this exercise you'll be writing code to print name badges for factory employees. 
Employees have an ID, name, and department name. 
Employee badge labels are formatted as follows: `"[id] - name - DEPARTMENT"`.

## 1. Print a badge for an employee

Implement the `print_name_badge` function. It should take an ID, name, and a department.
It should return the badge label, with the department name in uppercase.

```R
print_name_badge(67, "Katherine Williams", "Strategic Communication")
# => "[67] - Katherine Williams - STRATEGIC COMMUNICATION"
```

## 2. Print a badge for a new employee

Due to a quirk in the computer system, new employees occasionally don't yet have an ID when they start working at the factory. 
As badges are required, they will receive a temporary badge without the ID prefix.

Extend the `print_name_badge` function. When the id is missing, it should print a badge without it.

```R
print_name_badge(NA, "Robert Johnson", "Procurement")
# => "Robert Johnson - PROCUREMENT"
```

## 3. Print a badge for the owner

Even the factory's owner has to wear a badge at all times. 
However, an owner does not have a department and never will: they are above all the departments. 
In this case, the label should print `"OWNER"` instead of the department name.

Extend the `print_name_badge` function. When the department is `NULL`, assume the badge belongs to the company owner.

```R
print_name_badge(204, "Rachel Miller", NULL)
# => "[204] - Rachel Miller - OWNER"
```

Note that it is possible for the owner to also be a new employee.

```R
print_name_badge(NA, "Rachel Miller", NULL)
# => "Rachel Miller - OWNER"
```

## 4. Calculate the total salary of employees with no ID

As a rough metric of how well the IDs are being issued, you want to see the combined salary of employees with no ID. 
A high value means lots are waiting, or the problem is affecting senior people: both are bad.

Implement the `salaries_no_id` function that takes a vector of IDs and a corresponding vector of salaries, and returns the sum of salaries for people with no ID yet. 
Both vectors are the same length.

```R
ids <- c(204, NA, 210, 352, NA, 263)
salaries <- c(23, 21, 47, 35, 17, 101) * 1000
salaries_no_id(ids, salaries)
# => 38,000
```

_As an untested extra learning:_ If there are no employees without ID, what is the "empty vector" that you are summing?

## Source

### Created by

- @colinleach