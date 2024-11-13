module PascalsTriangle

let rows numberOfRows : int list list =
    let rec make_row (accum: int list) (rest: int list) : int list =
        match rest with
        | h1::h2::t -> make_row ((h1 + h2)::accum) (h2::t)
        | _ -> 1::accum
        
    let rec row_recurse (so_far: int list list) : int list list =
        let prev = so_far[0]
        if List.length prev  = numberOfRows then
            so_far
        else
            let new_row = make_row [1] prev
            row_recurse (new_row::so_far)
            
    if numberOfRows > 0 then List.rev (row_recurse [[1]]) else []
    