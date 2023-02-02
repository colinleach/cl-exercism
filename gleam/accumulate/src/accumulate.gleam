fn accum_helper(accumulator: List(b), fun: fn(a) -> b, xs: List(a)) -> List(b) {
  case xs {
    [] -> accumulator
    [y, ..ys] -> accum_helper([fun(y), ..accumulator], fun, ys)
  }
}

fn reverse(accumulator: List(b), xs: List(b)) -> List(b) {
  case xs {
    [] -> accumulator
    [y, ..ys] -> reverse([y, ..accumulator], ys)
  }
}

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  let rev_output = accum_helper([], fun, list)
  reverse([], rev_output)
}
