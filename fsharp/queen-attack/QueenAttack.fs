module QueenAttack

let create ((r, c): int * int) = 
    r >= 0 && r <= 7 && c >= 0 && c <= 7

let canAttack (queen1: int * int) (queen2: int * int) = 
    let (r1, c1) = queen1
    let (r2, c2) = queen2
    r1 = r2 || c1 = c2 || abs (r2 - r1) = abs (c2 - c1)