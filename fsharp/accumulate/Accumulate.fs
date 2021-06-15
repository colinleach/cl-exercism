module Accumulate

let rec private accumHelper accumulator func xs =
    match xs with
    | []    -> accumulator
    | y::ys -> accumHelper ((func y)::accumulator) func ys 
    // NB output list is reversed for efficiency

let rec private reverse accumulator xs = 
    match xs with
    | []    -> accumulator
    | y::ys -> reverse (y::accumulator) ys
 
let accumulate (func: 'a -> 'b) (input: 'a list): 'b list = 
    let revOutput = accumHelper [] func input
    // put the list back in the correct order
    reverse [] revOutput
    