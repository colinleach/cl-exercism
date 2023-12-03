# Queen Attack

Welcome to Queen Attack on Exercism's Scheme Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given the position of two queens on a chess board, indicate whether or not they are positioned so that they can attack each other.

In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal.

A chessboard can be represented by an 8 by 8 array.

So if you are told the white queen is at `c5` (zero-indexed at column 2, row 3) and the black queen at `f2` (zero-indexed at column 5, row 6), then you know that the set-up is like so:

```text
  a b c d e f g h
8 _ _ _ _ _ _ _ _ 8
7 _ _ _ _ _ _ _ _ 7
6 _ _ _ _ _ _ _ _ 6
5 _ _ W _ _ _ _ _ 5
4 _ _ _ _ _ _ _ _ 4
3 _ _ _ _ _ _ _ _ 3
2 _ _ _ _ _ B _ _ 2
1 _ _ _ _ _ _ _ _ 1
  a b c d e f g h
```

You are also able to answer whether the queens can attack each other.
In this case, that answer would be yes, they can, because both pieces share a diagonal.


## Track Specific Notes

For this track, each queen's position will be represented as a list
containing the row and the column\.
You should assume all inputs are valid, there's no need to report errors\.

## Running and testing your solutions


### From the command line

Simply type `make chez` if you're using ChezScheme or `make guile` if you're using GNU Guile\.
Sometimes the name for the scheme binary on your system will differ from the defaults\.
When this is the case, you'll need to tell make by running `make chez chez=your-chez-binary` or `make guile guile=your-guile-binary`\.

### From a REPL

* Enter `(load "test.scm")` at the repl prompt\.
* Develop your solution in `queen-attack.scm` reloading as you go\.
* Run `(test)` to check your solution\.

### Failed Test Cases

If some of the test cases fail, you should see the failing input and the expected output\.
The failing input is presented as a list because the tests call your solution by `(apply queen-attack input-list)`\.
To learn more about `apply` see [The Scheme Programming Language -- Chapter 5](https://www.scheme.com/tspl4/control.html#./control:h1)

## Source

### Created by

- @jitwit

### Based on

J Dalbey's Programming Practice problems - https://users.csc.calpoly.edu/~jdalbey/103/Projects/ProgrammingPractice.html