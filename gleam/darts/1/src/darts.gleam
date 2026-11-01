pub fn score(x: Float, y: Float) -> Int {
  let r_sq = x *. x +. y *. y
  case r_sq {
    _ if r_sq <=. 1.0 -> 10
    _ if r_sq <=. 25.0 -> 5
    _ if r_sq <=. 100.0 -> 1
    _ -> 0
  }
}
