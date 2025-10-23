# Cheese Club

Welcome to Cheese Club on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Technically, a `Higher Order Function` is simply a function which does at least one of:

- Accepts a function as one of its arguments.
- Returns a function as its result.

Within the world of functional programming, usage tends to be narrower.
The term usually refers to functions such as `filter`, `map` and `reduce` which apply a passed-in function to the elements of a collection.

## Operating on collections

By this point in the syllabus, we have already seen various ways to apply an operation to all elements of an iterable collection, such as a Vector:

- Use a loop (like most programming languages since the dawn of digital computing).
- Use a comprehension (Python-style).
- Use broadcasting (distinctively Julia syntax, though with a large debt to R, Matlab and NumPy).

This Concept will focus on higher-order functions (familiar from any functional language, such as Haskell or F#).

Other possible approaches include:

- Recursion (as in ML-family languages). 
  - Julia allows this, but without tail-call optimization it risks stack overflow.
- Metaprogramming with macros (traditionally a Lisp feature). 
  - This is widely used in advanced Julia programming, but _approach with caution_ in most cases. 
  - Other options are likely to be easier to write and much easier to debug.

## Filtering

The `filter()` function takes a passed-in function with a boolean return value and applies it to a collection.
Only elements returning `true` are included in the return value, which is of the same _basic_ type as the input (see below).

```julia-repl
julia> filter(iseven, 1:6)
3-element Vector{Int64}:
 2
 4
 6

# String is a collection of Chars, so String in -> String out
julia> filter(!isascii, "Hrōðgār")
"ōðā"

# tuple input -> tuple output
julia> filter(iseven, (1, 2, 3, 4, 5))
(2, 4)
```

With multi-dimensional arrays, `filter` flattens the input dimensions and returns a Vector: _the main exception to any rule about output type matching input type_.

```julia-repl
julia> m
2×3 Matrix{Int64}:
 1  2  3
 4  5  6

julia> filter(isodd, m)
3-element Vector{Int64}:
 1
 5
 3
```

The examples above use built-in functions, but use of anonymous functions is very common in this context.

```julia-repl
julia> filter(x -> x % 3 == 0, 1:20)
6-element Vector{Int64}:
  3
  6
  9
 12
 15
 18
```

There is also an in-place version, `filter!()`, as there is for many of the functions in this Concept.

## Mapping

The `map()` function transforms a collection by applying a function to each element.
This can be similar to broadcasting in simple cases, with the output shape matching the input.

```julia-repl
julia> map(√, [1, 4, 9])
3-element Vector{Float64}:
 1.0
 2.0
 3.0

julia> map(x -> x^2 + 1, 1:4)
4-element Vector{Int64}:
  2
  5
 10
 17

julia> m
2×3 Matrix{Int64}:
 1  2  3
 4  5  6

julia> map(√, m)
2×3 Matrix{Float64}:
 1.0  1.41421  1.73205
 2.0  2.23607  2.44949
```

`map()` will also operate element-wise on multiple collections.

```julia-repl
julia> map(*, [1, 2], [3, 4])
2-element Vector{Int64}:
 3
 8
```

Conceptually, we can think of this as equivalent to running `zip()` on the multiple input collections, then `map()` on each element of the intermediate result.
_This is only a rough analogy, implying nothing about the implementation!_

As with `zip()`, collections of mismatched shape are truncated to the dimension(s) of the smallest.

Sometimes only the side effects of the passed-in function are needed, such as a database write or a `push!` to an array.
Then the higher-order function `foreach()` is available, which always returns `nothing`.

## Reducing

The `reduce()` function takes a 2-argument function and applies it to a collection, leading to a dimension-reduction.

That may sound confusing in the abstract, but consider functions like `sum()` or `prod()` which take in a collection and return a single value.

```julia-repl
julia> sum(1:4) # add
10

julia> prod(1:4) # multiply
24
```

_These special functions are highly optimized and should always be used when available._
Other examples include `maximum()` and `minimum()`, logical functions `all()` and `any()`, and many statistical functions.

_For illustration only_, consider the same functionality implemented with the more generic `reduce()` (recall that infix operators `+` and `*` are really functions internally).

```julia-repl
julia> reduce(+, 1:4) # add
10

julia> reduce(*, 1:4) # multiply
24
```

As with `sum()` and other aggregation functions, `reduce()` can take an optional keyword argument `dims`, to specify the dimension(s) to reduce.

```julia-repl
julia> m
2×3 Matrix{Int64}:
 1  2  3
 4  5  6

julia> reduce(+, m; dims=1)
1×3 Matrix{Int64}:
 5  7  9
```

These are easy examples, because add and multiply are both commutative (`1+2 == 2+1`) and associative ( `(1+2)+3 == 1+(2+3)` ).

This is far from universal!
Even such common operations as minus and divide are non-associative.

There is the additional problem that floating-point errors can accumulate across large collections, so a left-to-right reduce may produce a slightly different answer than right-to-left.

The direction of Julia's `reduce` function is implementation-dependent and not guaranteed.

To control direction explicitly, there are `foldl()` and `foldr()` functions, notionally starting at the "left" and "right" respectively (actually top and bottom, for a Vector).

```julia-repl
julia> foldl(-, 1:3) # (1 - 2) - 3
-4

julia> foldr(-, 1:3) # 1 - (2 - 3)
2
```

Note that these are intended for collections that can be treated as one-dimensional, returning a scalar result.
Use of a `dims` argument is not supported for `foldl` and `foldr`, only for `reduce`.

## MapReduce

Combining a `map` operation with a `reduce` is very common in various programming domains.

We could sequentially run `map`, then run `reduce` on an intermediate collection.
However, this is inefficient at best, and scales very badly as the collection gets larger.

It is _strongly_ recommended to use the combined `mapreduce()` function instead.
It can implement a much more performant algorithm which interleaves the map/reduce operations.

The first argument is the function to map with, the second argument is the reduce operator.

```julia-repl
julia> mapreduce(x -> x^2 + 1, +, 1:3)
17

# equivalent to (2 + 5 + 10)
julia> sum(map(x -> x^2 + 1, 1:3))
17
```

As we might expect, Julia also has `mapfoldl()` and `mapfoldr()` functions for sitations where direction is important.

## Instructions

We are starting up a cheese club, which will use ML to select new cheeses to offer our cheese-loving customers based on their histories and tastes.

New members are required to fill out an initial survey so we can gather some basic data to start with.
Through this, it's been found that there is a subset of emphatic clients who lack nuance in their critiques.
As this can end up irrevocably biasing a more nuanced algorithm, there is a separate algorithm set up to handle their needs.
You are asked to provide some helper functions to wrangle their data.

~~~~exercism/note
While there may be different ways to solve the following tasks, each can be solved with a different single higher order function.
~~~~

## 1. Classify customers

The rating system has a five star basis, which is simply consists of integers `1:5`.
The emphatic customers will only give ratings of `1` or `5`, and we want to know if a customer exhibits this behavior.

Implement `all_15()` which takes a vector of ratings and returns `true` if all ratings are either `1` or `5`, and false otherwise.

```julia-repl
julia> ratings = [2, 3, 4, 4, 1];

julia> all_15(ratings)
false

julia> ratings = [1, 5, 5, 1, 5];

julia> all_15(ratings)
true
```

## 2. Separate out emphatic customers

We need to separate the more emphatic customers from the others.

Implement `emphatics()` which takes a dictionary of customers and ratings.
Returns a similar dictionary with those who only use only `1` or `5` star ratings.

```julia-repl
julia> ratings = ([2, 3, 5, 1, 1], [1, 1, 5, 5, 1], [4, 5, 5, 3, 2], [5, 5, 1, 1, 5]);

julia> names = ("c1", "c2", "c3", "c4");

julia> customers = Dict(zip(names, ratings))
Dict{String, Vector{Int64}} with 4 entries:
  "c2" => [1, 1, 5, 5, 1]
  "c1" => [2, 3, 5, 1, 1]
  "c3" => [4, 5, 5, 3, 2]
  "c4" => [5, 5, 1, 1, 5]

julia> emphatics(customers)
Dict{String, Vector{Int64}} with 2 entries:
  "c2" => [1, 1, 5, 5, 1]
  "c4" => [5, 5, 1, 1, 5]
```

## 3. Change ratings to binary

Since the emphatic customers only use `1` and `5` ratings, it will more computationally convenient if these are changed these to `0` and `1`.

Implement `tobinary()` which takes vector of emphatic ratings.
Returns binary ratings, where `1` has been changed to `0` and `5` has been changed to `1`.

```julia-repl
julia> ratings = [1, 1, 5, 5, 1];

julia> tobinary(ratings)
5-element Vector{Int64}:
 0
 0
 1
 1
 0
```

## 4. Make ratings into a matrix

Our algorithms use `Matrix` inputs, so we will need to transform the data into one.

Implement `tobinarymatrix()` which takes a vector of emphatic rating vectors.
Returns a `Matrix` of the transformed data, with each rating vector a *row* in the matrix.

```julia-repl
julia> customersratings = [[1, 1, 5, 5, 1],[5, 5, 1, 1, 5]];

julia> tobinarymatrix(customersratings)
2×5 Matrix{Int64}:
 0  0  1  1  0
 1  1  0  0  1
```

## Source

### Created by

- @depial