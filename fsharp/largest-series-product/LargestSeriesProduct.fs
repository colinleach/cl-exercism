module LargestSeriesProduct

open System

let largestProduct (input: string) seriesLength : int option =
    if seriesLength < 0 || seriesLength > String.length input then
        None
    else
        let digits = input |> Seq.toArray
        if (Array.forall Char.IsDigit digits) then 
            let products =
               digits |>
               Array.map (fun c -> int (c - '0')) |>
               Array.windowed seriesLength |>
               Array.map (fun group -> group |> Array.reduce (*)) |>
               Array.toList
            Some (List.max products)
        else
            None
   