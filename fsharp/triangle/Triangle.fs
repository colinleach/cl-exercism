module Triangle

let isTriangle (a: float) (b: float) (c: float) =
    (a + b >= c) && (b + c >= a) && (a + c >= b) && a <> 0 && b <> 0 && c <> 0
    
let unpackTriangle triangle =
    match triangle with
    | [a: float; b: float; c: float] ->
        if isTriangle a b c then Some (a, b, c) else None
    | _ -> None  

let equilateral triangle =
    match unpackTriangle triangle with
    | Some (a, b, c) -> (a = b) && (b = c)
    | None -> false

let isosceles triangle =
    match unpackTriangle triangle with
    | Some (a, b, c) -> a = b || b = c || c = a
    | None -> false

let scalene triangle =
    match unpackTriangle triangle with
    | Some (a, b, c) -> a <> b && b <> c && a <> c
    | None -> false