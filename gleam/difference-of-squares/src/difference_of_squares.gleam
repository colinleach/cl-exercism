// import gleam/list
// import gleam/int

// pub fn square_of_sum(n: Int) -> Int {
//   list.range(1, n)
//   |> int.sum
//   |> fn(x) { x * x }
// }

// pub fn sum_of_squares(n: Int) -> Int {
//   list.map(list.range(1, n), fn(x) { x * x })
//   |> int.sum
// }

// pub fn difference(n: Int) -> Int {
//   square_of_sum(n) - sum_of_squares(n)
// }

import gleam/iterator.{map, range, to_list}
import gleam/int.{sum}

pub fn square_of_sum(n: Int) -> Int {
  range(1, n)
  |> to_list
  |> sum
  |> fn(x) { x * x }
}

pub fn sum_of_squares(n: Int) -> Int {
  map(range(1, n), fn(x) { x * x })
  |> to_list
  |> sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
