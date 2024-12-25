module [score]

score : F64, F64 -> U64
score = \x, y ->
    r = Num.sqrt (x^2 + y^2)
    if r <= 1 then
        10
    else if r <= 5 then
        5
    else if r <= 10 then
        1
    else
        0

