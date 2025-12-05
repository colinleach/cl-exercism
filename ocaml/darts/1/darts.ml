let score (x: float) (y: float): int =
  let rsq = x *. x +. y *. y in
  match rsq with
  | rsq when rsq <= 1.0 -> 10
  | rsq when rsq <= 25.0 -> 5
  | rsq when rsq <= 100.0 -> 1
  | _ -> 0
  