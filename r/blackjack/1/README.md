# Blackjack

Welcome to Blackjack on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The `switch()` function can be a concise replacement for a long series of `if` ... `else if` tests.
The variable being switched on is most commonly a string, and if so the quotes can be omitted from the selector.

```R
star <- function(type) {
  switch(type,
    M = , # will "fall through" if no value given
    K = "red dwarf",
    G = "Earth-like",
    "bigger star" # only correct for O,B,A,F
  )
}

> star("M")
[1] "red dwarf"
```

Note that options will only fall through if the value is left blank, as with `M` in the example above.
There is no need to include `break` statements as with some other languages.

When switching on `character` types, the final value is a default, as here.
With integer types, no default can be given.

## Functions in `dplyr`

The `switch` in base R is quite limited: it will only do an exact match to a single input.
This seemed reasonable when R was first released in 1993, but needs improvement for modern usage.

~~~~exercism/note
As mentioned in the [`Conditionals`][concept-conditionals] Concept, the `tidyverse` collection of packages is designed to supplement (and sometimes replace) base R functionality without impacting backwards compatibility.

The `dplyr` package can be brought into scope by adding either `library(dplyr)` (for the single package) or `library(tidyverse)` (for the whole collection) to the top of your code.

[concept-conditionals]: https://exercism.org/tracks/r/concepts/conditionals
~~~~

The `dplyr` library provides two extra functions related to `switch`.

### The `case_match` function

`case_match` is essentially a vectorized version of `switch`, with some extra options.

Matching is still exact, but:

- The options on the left can be vectors, and the input matches if any element matches.
- Options on the left and results on the right are linked with a tilde `~` instead of `=`.
- A default can be specified in all cases.

```R
library(dplyr)

x <- c("a", "b", "a", "d", "b", "c", "e")
case_match(
  x,
  "a" ~ 1,
  "b" ~ 2,
  "c" ~ 3,
  c("d", "e") ~ 4, # either "d' or "e" will match
  .default = 100   # note the different syntax for the default
)
#> [1] 1 2 1 4 2 3 4
```

### The `case_when` function

`case_when` takes `case_match` syntax a stage further, by allowing any logical expression on the left of the `~`.

The input vector (`x` in the example below) is not supplied as an argument, it just needs to be already defined.

```R
x <- 1:10
case_when(
  x < 3 ~ "low",
  between(x, 3, 5) ~ "mid",
  between(x, 6, 8) ~ "high",
  .default = "what?"
)
#>  [1] "low"   "low"   "mid"   "mid"   "mid"   "high"  "high"  "high"  "what?" "what?"
```

The `between()` function is also part of `dplyr`.

## Instructions

In this exercise we will simulate the first turn of a [Blackjack](https:#en.wikipedia.org/wiki/Blackjack) game.

You will receive two cards and will be able to see the face up card of the dealer. All cards are represented using a string such as "ace", "king", "three", "two", etc. The values of each card are:

| card  | value | card    | value |
| :---: | :---: | :-----: | :---: |
|  ace  |  11   | eight   |   8   |
|  two  |   2   | nine    |   9   |
| three |   3   |  ten    |  10   |
| four  |   4   | jack    |  10   |
| five  |   5   | queen   |  10   |
|  six  |   6   | king    |  10   |
| seven |   7   | *other* |   0   |

**Note**: Commonly, aces can take the value of 1 or 11 but for simplicity we will assume that they can only take the value of 11.

Depending on your two cards and the card of the dealer, there is a strategy for the first turn of the game, in which you have the following options:

- Stand (S)
- Hit (H)
- Split (P)
- Automatically win (W)

Although not optimal yet, you will follow the strategy your friend Alex has been developing, which is as follows:

- If you have a pair of aces you must always split them.
- If you have a Blackjack (two cards that sum up to a value of 21), and the dealer does not have an ace, a figure or a ten then you automatically win. If the dealer does have any of those cards then you'll have to stand and wait for the reveal of the other card.
- If your cards sum up to a value within the range [17, 20] you should always stand.
- If your cards sum up to a value within the range [12, 16] you should always stand unless the dealer has a 7 or higher, in which case you should always hit.
- If your cards sum up to 11 or lower you should always hit.

## 1. Calculate the value of any given card.

Implement a function `parse_card` to calculate the numerical value of a card:

```R
parse_card("ace")
# => 11
```

## 2. Implement the decision logic for the first turn.

Write a function `first_turn` that implements the decision logic as described above:

```R
first_turn(card1, card2, dealer_card)
```

Here are some examples for the expected outcomes:

```R
first_turn("ace", "ace", "jack") == "P"
first_turn("ace", "king", "ace") == "S"
first_turn("five", "queen", "ace") == "H"
```

## Source

### Created by

- @colinleach