square_of_sum <- function(n) { (n * (n + 1) / 2)^2 }

sum_of_squares <- function(n) { n * (n + 1) * (2 * n + 1) / 6 }

difference_of_squares <- function(n) { square_of_sum(n) - sum_of_squares(n) }
