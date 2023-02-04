module Darts

let score (x: double) (y: double): int =
    let r = sqrt (x*x + y*y)
    if r <= 1 then 10
    elif r <= 5 then 5
    elif r <= 10 then 1
    else 0