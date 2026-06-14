# Coordinate Transformation

Welcome to Coordinate Transformation on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Functions were introduced back in the [Basics][concept-basics] Concept, with examples such as this:

```R
squareit <- function(x) {
    x * x
}

squareit(3)
#> [1] 9

# shorter form
squareit_short <- function(x) x ^ 2
```

Looking more closely at the definition of `squareit`, we can identify various parts:

- The function takes a formal argument `x`.
- There is a function body, usually in braces`{ }`.
- Once the function object is created, it is assigned to a variable `squareit`.

A function is a first class object in R, much like numbers and strings.
Thus, `squareit <- function...` is an assignment which is syntactically just like `x <- 42`.

## Arguments

R makes no clear distinction between positional arguments and keyword arguments, in contrast to other scripting languages such as Python and Julia.

Function calls can pass values either positionally or by name.
The latter is useful for complex functions with many arguments, where it is hard to remember their order.

```R
f <- function(x, y) x / y

# call positionally
f(4, 2)
#> [1] 2

# call by name
f(y = 2, x = 4)
#> [1] 2
```

### Optional arguments

Default argument values can be specified in the function definition, but must come after all the arguments without defaults.

We can then choose whether to accept the default or override it.

```R
g <- function(x, y = 2) x / y

# default y value
g(6)
#> [1] 3

# explicit y value
g(6, 3)
#> [1] 2
```

### Extra arguments

To accept an arbitrary number of additional arguments, use a `...` (ellipsis) in the definition.
It is possible to convert any extra values in the function call to a vector, but please read on for an alternative way to use these "dot args" (*called "varargs" in several other languages*).

```R
var_f <- function(x, y, ...) {
  print(c(...))
}

var_f(2, 3, "opt1", "opt2")
#> [1] "opt1" "opt2"
```

## Function Environment

Previously, we said that the formal arguments and the body are both components of a function.

In fact, there is a third component: the *environment* in which the function is defined.

This can be illustrated with the case of nested functions:

```R
outer_func <- function(x) {
  inner_func <- function(y) {
    x * y
  }
  
  inner_func(3)
}

outer_func(5)
#> [1] 15
```

The function call passes `x = 5` to the outer function, and this value is available within that function body.

The inner function is *part* of the outer function body, and has access to the value of `x`.
Worded differently, `x = 5` is in the *environment* of the inner function.

Technically, this is known as a [closure][wiki-closure].

The environment is particularly important with dot args, as any values supplied this way can be passed through to function calls in the function body.
The outer function need not know or care what the dot args mean.

```R
f_var <- function(x, ...) {
  sum(x, ...)
}

x <- c(1, 2, NA, 6)

# for sum(), na.rm defaults to FALSE
f_var(x)
#> [1] NA

# pass through the na.rm value
f_var(x, na.rm = TRUE)
#> [1] 9
```

This technique is used extensively by Tidyverse libraries such as [`stringr`][ref-stringr].
Many of the `stringr` functions are a user-friendly wrapper around low-level functions from `stringi` and base R.

Extra arguments supplied to the `str_*()` functions are simply passed through to those lower-level functions.

## Functions as return values

An outer function can define an inner function (either named, or anonymous as described below) and use it as the return value.

The returned function will include the environment in which it was defined.

```R
times_y <- function(x) {
  # anonymous function - see next section
  \(y) x * y
}

f <- times_y(3)
class(f)
#> [1] "function"

f(4)
#> [1] 12
```

## Anonymous Functions

When we define a function, we usually bind the resulting function object to a variable.

```R
x <- 2

# function definition captures x from the environment
doubleit_short <- function(y) x * y
```

This makes it easy to use the function later in the script, but such binding is not necessary.
A short, use-once function can be useful in the immediate context.
Without name-binding, it it called an *anonymous function*.

Use of anonymous functions is so common that (*since R v4.1.0*) there is a shorthand syntax to define them: replace the word `function` with a backslash `\`.

An example of this was used in the previous section, on return values.

## Copy on Modify

R allows assignment to individual elements of a vector.
If we pass in a vector as a function argument, and modify it in the function body before returning it, we get a modified vector.

But what happened to the original vector?

```R
f <- function(vec) {
  vec[1] <- 42
  vec
}

vals <- c(1, 3, 4)

# f() returns a modified vector
f(vals)
#> [1] 42  3  4  

# the original vector is unchanged.
vals
#> [1] 1 3 4
```

R is a language designed for data science.
Collecting that data can cost a lot in time, effort, and potentially an eye-watering amount of money: *it is important not to corrupt it!*

The general policy (with a few exceptions) is *copy on modify*.
If an object (such as a vector) is changed in a way that could cause later problems, R returns a *modified copy* and leaves the original untouched.

Copying large data structures can be computationally expensive, but this is generally the lesser evil when the alternative is data corruption.

~~~~exercism/caution
Beware of operations that lead to repeated copying of the same data.

Paraphrasing (Tidyverse author) Hadley Wickham:

> Loops are not inherently slow, but they make it dangerously easy to include slow operations within the loop.

Vectorization or higher-order functions can help to protect you from this type of performance-killer.
~~~~

[concept-basics]: https://exercism.org/tracks/r/concepts/basics
[wiki-closure]: https://en.wikipedia.org/wiki/Closure_(computer_programming)
[ref-stringr]: https://stringr.tidyverse.org/index.html

## Instructions

Your company has been working with mapping data to build web pages.
After some discussion, a decision is made to start using R to perform some calculations dynamically.

Please aim to work directly with the vector points: there is no need to unpack them into separate `x` and `y` coordinates.

## 1. Scale the coordinates

Implement the `scale(point, s)` function that takes a point with arbitrary number of dimensions, and scales it by the pre-defined `s`.

```R
# A 2D example
s <- c(0.5, 0.8)
point <- c(10, 5)
scale(point, s)
#> [1] 5 4
```

## 2. Translate the coordinates

Implement the `translate(point, ...)` function that returns a new point, with each coordinate moved by the values in the ellipses.

This function must be able to handle points of any dimension, with the number of dot args matching that dimension.

```R
point2d <- c(2, 3)

# supply dx, dy translations
translate(point2d, 0.5, 0.6)
#> [1] 2.5 3.6

point3d <- c(2, 3, 4)

# supply dx, dy, dz translations
translate(point3d, 0.5, 0.6, 0.7)
#> [1] 2.5 3.6 4.7
```

## 3. Transform a 2D point

Some of your teammates are less experienced with R, so you decide to use a function closure to create reusable transformations for `{x, y}` coordinate pairs.

Implement the `transform2d(dx, dy, s)` function that returns a function making use of a closure to perform a repeatable 2d translation and scaling of a point.

The scaling argument `s` should be optional, with a default value of `1`.

The returned function should take a 2D point, then:

1. translate it by the pre-defined `dx` and `dy`
2. scale it by `s`

```R
# scale all coordinates by the same amount (2) in this example
# your code needs to be able to handle a vector `s`

tf2d <- transform2d(0.5, 0.6, 2)
class(tf2d)
#> [1] "function"

tf2d(c(2, 3))
#> [1] 5.0 7.2

# Accept default for `s`
tf2d <- transform2d(0.5, 0.6)

tf2d(c(2, 3))
#> 2.5 3.6
```

The order of operations is important: translate-then-scale gives the correct result, scale-then-translate does not.
In technical language, the operations _do not commute_.

## 4. Transform a 3D point

Mapping data can also contain heights, used to add shading and contours on screen.

Implement the `transform3d(dx, dy, dz, s)` function that returns a function.

The scaling argument `s` should be optional, with a default value of `1`.

The returned function should take a 3D point, translate it by the pre-defined values, then scale it by `s`.

```R
# using default `s`
tf3d <- transform3d(0.5, 0.6, 0.7)
point <- c(2, 3, 4)
tf3d(point)
#> [1] 2.5 3.6 4.7

# using vector `s`
tf3d <- transform3d(0.5, 0.6, 0.7, c(0.5, 0.6, 0.7))
tf3d(point)
#> [1] 1.25 2.16 3.29
```

## Source

### Created by

- @colinleach