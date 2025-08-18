def square_of_sum (n: i32): i32 = 
let sum: i32 = n * (n + 1) / 2
  in sum * sum

def sum_of_squares (n: i32): i32 = n * (n + 1) * (2 * n + 1) / 6

def difference_of_squares (n: i32): i32 = 
    square_of_sum(n) - sum_of_squares(n)
  