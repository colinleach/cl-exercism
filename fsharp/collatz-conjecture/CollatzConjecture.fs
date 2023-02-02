module CollatzConjecture

let rec step (n: int, stepcount: int): int =
    if n = 1 then
        stepcount
    else
        let newnum = if n % 2 = 0 then n / 2 else 3 * n + 1
        step(newnum, stepcount + 1)
    
let steps (number: int): int option =
    if number < 1 then
        None
    else
        let count = step(number, 0)
        Some count