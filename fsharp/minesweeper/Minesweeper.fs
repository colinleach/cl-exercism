module Minesweeper

open System.Numerics

let annotate minefield =
    let offsets = [for i in -1..1 do for j in -1..1 do yield Complex(i, j)]
    
    let count_adjacent row col =
        let currPos = Complex(row, col)
        let adj_squares = Seq.map (Complex.Add currPos) offsets
        List.choose ()
        
        
    let processSquare row col =
        let value = minefield[row][col]
        match value with
        | '*' -> "*"
        | _ ->
            let count = count_adjacent row col
            if count > 0 then count.ToString else " "
        
    let rows = List.length minefield
    if rows = 0 then [] else
        let cols = String.length minefield[0]
        List.iter (String.iter processSquare 0..(cols - 1)) 0..(rows - 1)


// function annotate(minefield)
//     function process_square(row, col)
//         value = minefield[row][col]
//         if value == '*'
//             return "*"
//         end
//         if value == ' '
//             count = count_adjacent(row, col)
//             return  count > 0 ? string(count) : " "
//         end
//     end
//
//     function count_adjacent(row, col)
//         offsets = [(r + c * 1im) for r = -1:1 for c = -1:1]
//         adj_squares = [row + col * 1im + offset for offset in offsets]
//         neighbors = [minefield[real(sq)][imag(sq)] for sq in adj_squares
//                      if 1 <= real(sq) <= rows && 1 <= imag(sq) <= cols]
//         return length([adj for adj in neighbors if adj == '*'])
//     end
//
//     rows = length(minefield)
//     if rows > 0
//         cols = length(minefield[1])
//     else
//         return []
//     end
//
//     [join([process_square(row, col) for col in 1:cols]) for row in 1:rows]
// end

