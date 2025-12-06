fun score (x: real, y: real): int =
  let 
    val r_sq = x*x + y*y
  in
    if r_sq <= 1.0 then 10
    else if r_sq <= 25.0 then 5
    else if r_sq <= 100.0 then 1
    else 0
  end
