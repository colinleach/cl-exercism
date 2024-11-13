module BinarySearch

let find (input: int array) value =
    let rec subfind first last =
        match last - first with
        | n when n >= 0 && n <= Array.length input - 1 ->
            let mid = (first + last) / 2
            match input[mid] with
            | v when v = value -> Some mid
            | v when v > value -> subfind first (mid - 1)
            | _ -> subfind (mid + 1) last
        | _ -> None
        
    subfind 0 (Array.length input - 1)
